import 'package:flutter/material.dart';
import 'package:p5/models/category.dart';

class CategoryGriditem extends StatelessWidget {
  const CategoryGriditem({
    super.key,
    required this.category,
    required this.onSelectCat,
  });

  final Category category;
  final void Function() onSelectCat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCat();
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 150, 
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.3),
              category.color.withOpacity(0.13),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
