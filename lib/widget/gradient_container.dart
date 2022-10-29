import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  double? padding;
  double? margin;
  final Widget child;
   GradientContainer({required this.child,this.margin=16,this.padding=20,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(margin!),
      padding:  EdgeInsets.all(padding!),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.surfaceVariant,
                Theme.of(context).colorScheme.background,
              ]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: child,
    );
  }
}
