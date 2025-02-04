import 'package:flutter/material.dart';
import 'package:p5/data/dummy_data.dart';
import 'package:p5/models/meals.dart';
import 'package:p5/screens/categories.dart';
import 'package:p5/screens/filters.dart';
import 'package:p5/screens/mealsScreen.dart';

const kIntialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.nutsFree: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilter = kIntialFilters;

  void _infoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteState(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _infoMessage('Meal is no longer a favorite.');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _infoMessage('Marked as a favorite!');
    }
  }

  void _selectedPage(int index) {
    if (index == 2) {
      Navigator.of(context)
          .push(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilter: _selectedFilter,
          ),
        ),
      )
          .then((result) {
        if (result != null) {
          setState(() {
            _selectedFilter = result;
          });
        }
      });
    } else {
      setState(() {
        _selectedPageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.nutsFree]! && !meal.isnuts) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      onToggleFav: _toggleFavoriteState,
      availableMeals: availableMeals,
    );
    var activeTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favoriteMeals,
        onToggleFav: _toggleFavoriteState,
      );
      activeTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          activeTitle,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Filters',
          ),
        ],
      ),
    );
  }
}
