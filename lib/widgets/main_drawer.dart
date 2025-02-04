import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen,});

final void Function(String ID) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(245, 240, 211, 204),
                  Color.fromARGB(150, 224, 180, 169),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                    color: Color.fromARGB(255, 54, 39, 36),
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up !',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color.fromARGB(255, 54, 39, 36),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 24,
              color: Colors.white,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            onTap: () {onSelectScreen('Meals');},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 24,
              color: Colors.white,
            ),
            title: Text(
              'Filters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            onTap: () {onSelectScreen('filters');},
          ),
        ],
      ),
    );
  }
}
