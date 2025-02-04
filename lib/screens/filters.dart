import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  nutsFree,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilter,
  });

  final Map<Filter, bool> currentFilter;
  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeSet = false;
  var _lactoseFreeSet = false;
  var _nutsFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeSet = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeSet = widget.currentFilter[Filter.lactoseFree]!;
    _nutsFree = widget.currentFilter[Filter.nutsFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeSet,
            Filter.lactoseFree: _lactoseFreeSet,
            Filter.nutsFree: _nutsFree,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeSet = isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Here is your Gluten-free meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: const Color.fromARGB(166, 240, 111, 51),
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeSet = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Here is your Lactose-free meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: const Color.fromARGB(166, 240, 111, 51),
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            
            SwitchListTile(
              value: _nutsFree,
              onChanged: (isChecked) {
                setState(() {
                  _nutsFree = isChecked;
                });
              },
              title: Text(
                'Nuts-Free',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Here is your Nuts free meals',
                style: TextStyle(color: Colors.white),
              ),
              activeColor: const Color.fromARGB(166, 240, 111, 51),
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
