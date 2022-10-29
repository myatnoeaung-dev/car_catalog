import 'package:flutter/material.dart';

import 'gradient_container.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      margin: 16,
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "20%",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                "New Arrival",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Get a new car discount, only valid this friday",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
        SizedBox(
          height: 120,
          width: 150,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://www.auto-data.net/images/f38/Rolls-Royce-Spectre.jpg"),
                )),
          ),
        )
      ]),
    );
  }
}
