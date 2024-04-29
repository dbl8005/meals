import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meals_provider.dart';

class AddNewMeal extends ConsumerStatefulWidget {
  const AddNewMeal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNewMealState();
}

class _AddNewMealState extends ConsumerState<AddNewMeal> {
  late Meal newMeal;
  final mealNameController = TextEditingController();
  final mealCategoryController = TextEditingController();

  @override
  void dispose() {
    mealNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Meal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: mealNameController,
              decoration: const InputDecoration(
                labelText: 'Meal Name',
              ),
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
            ),
            FloatingActionButton(
              // When the user presses the button, show an alert dialog containing
              // the text that the user has entered into the text field.
              onPressed: () {
                newMeal = Meal(
                  id: DateTime.now().toString(),
                  title: mealNameController.text,
                  categories: [],
                  ingredients: [],
                  steps: [],
                  complexity: Complexity.simple,
                  affordability: Affordability.affordable,
                  imageUrl: '',
                  duration: 0,
                  isGlutenFree: false,
                  isLactoseFree: false,
                  isVegan: false,
                  isVegetarian: false,
                );
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text that the user has entered by using the
                      // TextEditingController.
                      content: Text(newMeal.title),
                    );
                  },
                );
              },
              tooltip: 'Show me the value!',
              child: const Icon(Icons.text_fields),
            ),
          ],
        ),
      ),
    );
  }
}
