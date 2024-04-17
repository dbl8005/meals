import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.title,
      required this.meals,
      required this.selectedCategory});

  final String selectedCategory;
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (var meal in meals.where(
              (element) => element.categories.contains(selectedCategory)))
            MealItem(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
            ),
        ],
      ),
    );
  }
}
