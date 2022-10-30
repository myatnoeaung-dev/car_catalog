import 'package:car_catalog/product_detail.dart';
import 'package:flutter/material.dart';

import 'widget/new_arrival.dart';
import 'widget/product_card_item.dart';
import 'widget/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: null,
        ),
        actions: const [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: null,
          ),
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: SearchTextWidget(),
        ),
        SliverToBoxAdapter(child: NewArrival()),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              "Top deals",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8, maxCrossAxisExtent: 200),
            delegate: SliverChildBuilderDelegate(childCount: 10,
                (BuildContext context, int index) {
              return ProductCardItem(
                name: "$index",
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ProductDetailPage(
                  //               name: "$index",
                  //             )));
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 1700),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProductDetailPage(
                                    name: "$index",
                                  ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var fadeIn = Tween<double>(begin: 0, end: 1)
                                .animate(CurvedAnimation(
                                    curve: Interval(.7, 1), parent: animation));
                            var fadeOut = Tween<double>(begin: 0, end: 1)
                                .animate(CurvedAnimation(
                                    curve: Interval(0, .2), parent: animation));
                            return Stack(children: <Widget>[
                              FadeTransition(
                                  opacity: fadeOut,
                                  child: Container(color: Theme.of(context).colorScheme.background)),
                              FadeTransition(opacity: fadeIn, child: child)
                            ]);
                          }));
                },
              );
            }))
      ]),
    );
  }
}
