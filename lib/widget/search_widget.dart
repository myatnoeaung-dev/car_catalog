import 'package:flutter/material.dart';

class SearchTextWidget extends StatelessWidget {
  const SearchTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
            )),
      ),
    );
  }
}
