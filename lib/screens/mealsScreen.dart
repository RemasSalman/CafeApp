import 'package:flutter/material.dart';
import 'package:p5/models/meals.dart';
import 'package:p5/screens/meal_details.dart';
import 'package:p5/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFav,
  });

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal) onToggleFav;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(
          meal: meal,
          onToggleFav: onToggleFav,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sorry , No Content Here Currently ...',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
            meal: meals[index],
            onSelectedmeal: (meal) {
              selectMeal(context, meal);
            }),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
