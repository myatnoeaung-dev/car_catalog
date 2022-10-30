import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'widget/gradient_container.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  const ProductDetailPage({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      body: Container(
          height: hight,
          child: ClipPath(
            clipper: CustomClipperPaint(),
            child: Hero(
                transitionOnUserGestures: true,
                flightShuttleBuilder: _buildFlightWidget,
                tag: name,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            "https://www.auto-data.net/images/f118/Tesla-Model-S-facelift-2021.jpg"),
                      )),
                )),
          )),
    );
  }

  Widget _buildFlightWidget(
      BuildContext flightContext,
      Animation<double> animation,
      HeroFlightDirection flightDirection,
      BuildContext fromHeroContext,
      BuildContext toHeroContext) {
    return AnimatedBuilder(
      
      animation: animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    "https://www.auto-data.net/images/f118/Tesla-Model-S-facelift-2021.jpg"),
              )),
        );
      },
    );
  }
}

class CustomClipperPaint extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
