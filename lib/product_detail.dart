import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  const ProductDetailPage({required this.name,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Hero(
              transitionOnUserGestures: true,
              flightShuttleBuilder: _buildFlightWidget,
              tag: "product_image",
              child: CachedNetworkImage(
                  imageUrl:"https://www.auto-data.net/images/f118/Tesla-Model-S-facelift-2021.jpg"))),
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
        return DefaultTextStyle(
            style: DefaultTextStyle.of(toHeroContext).style,
            child: Container(
              height: 100,
              width: 200,
              color: Colors.red,
            ));
      },
    );
  }
}
