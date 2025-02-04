import 'package:flutter/material.dart';
import 'package:p5/models/meals.dart';
import 'package:p5/widgets/meal_itemTrait.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFav,
  });

  final Meal meal;
  final Function(Meal meal) onToggleFav;

  String get complexityText =>
      meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggleFav(meal),
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(201, 238, 142, 118),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                meal.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Color.fromARGB(255, 251, 249, 249),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MealItemtrait(
                        icon: Icons.schedule,
                        lable: '${meal.duration}min',
                      ),
                      const SizedBox(height: 28),
                      MealItemtrait(
                        icon: Icons.restaurant_menu,
                        lable: complexityText,
                      ),
                      const SizedBox(height: 28),
                      MealItemtrait(
                        icon: Icons.credit_card,
                        lable: meal.affordability,
                      ),
                    ],
                  ),
                  const SizedBox(width: 63),
                  Hero(
                    tag: meal.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          16), // Optional: adds rounded corners
                      child: Image.asset(
                        meal.imageUrl2,
                        width: 236,
                        height: 336, // Ensures consistent sizing
                        fit: BoxFit
                            .cover, // Ensures the image is scaled properly
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'Ingredianet',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(154, 238, 142, 118),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              for (final ingredient in meal.ingredients)
                Padding(
                  padding: const EdgeInsets.only(bottom: 13),
                  child: Text(
                    ingredient,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
