import 'package:flutter/material.dart';
import 'package:p5/data/dummy_data.dart';
import 'package:p5/models/category.dart';
import 'package:p5/models/meals.dart';
import 'package:p5/screens/mealsScreen.dart';
import 'package:p5/widgets/category_gridItem.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFav,
    required this.availableMeals,
  });
  final Function(Meal meal) onToggleFav;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationContrroler;

  @override
  void initState() {
    super.initState();
    _animationContrroler = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationContrroler.forward();
  }

  @override
  void dispose() {
    _animationContrroler.dispose();
    super.dispose();
  }

  void _selectedCategory(BuildContext context, Category category) {
    final filterdmeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealsScreen(
            title: category.title,
            meals: filterdmeals,
            onToggleFav: widget.onToggleFav,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationContrroler,
      child: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                   '  Hey! What would you like to have?',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                      color: Color.fromARGB(119, 240, 130, 102),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          for (final category in availableCategories)
            Padding(
              padding: const EdgeInsets.all(20),
              child: CategoryGriditem(
                category: category,
                onSelectCat: () {
                  _selectedCategory(context, category);
                },
              ),
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: Offset(0, 0.5),
          end: Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationContrroler, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
  }
}
