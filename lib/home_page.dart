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
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductDetailPage()));
                },
              );
            }))
      ]),
    );
  }
}
