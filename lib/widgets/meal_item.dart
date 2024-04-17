import 'dart:ffi';

import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
