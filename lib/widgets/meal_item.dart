import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends ConsumerWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteMealsProvider).contains(meal);
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.black54,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => MealDetailScreen(
                    meal: meal,
                  )),
            ),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealItemTrait(
                          icon: Icons.schedule, label: '${meal.duration} min'),
                      const SizedBox(width: 12),
                      MealItemTrait(icon: Icons.work, label: complexityText),
                      const SizedBox(width: 12),
                      MealItemTrait(
                        icon: Icons.attach_money,
                        label: affordabilityText,
                      )
                    ],
                  ),
                ]),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: isFavorite
                  ? const Icon(
                      Icons.star,
                      size: 26,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.star_border,
                      size: 26,
                      color: Color.fromARGB(100, 255, 255, 255),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
