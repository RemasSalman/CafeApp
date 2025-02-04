enum Complexity {
  simple,
  hard,
}



class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.imageUrl2,
    required this.ingredients,
    required this.description,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isnuts,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final String imageUrl2;

  final List<String> ingredients;
  final String description;
  final int duration;
  final Complexity complexity;
  final String affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isnuts;
}
