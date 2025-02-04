import 'package:riverpod/riverpod.dart';
import 'package:p5/data/dummy_data.dart';

final mealProvider = Provider((ref) {
  return dummyMeals;
});
