import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/models/meal.dart';


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});


  @override
  State<TabsScreen> createState() => _TabsScreen();
}


class _TabsScreen extends State<TabsScreen> {

  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),)
     );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if(isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        _showInfoMessage('Removed from Favourite');
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showInfoMessage('Added to Favourite');
      });
    }

  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(context) {
    Widget activePage  = CategoriesScreen(
      onToggleFavourite: _toggleMealFavouriteStatus);
    var activePageTitle = 'Category';

    if(_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
        );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle)
      ),
      drawer: Drawer()
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Your Favourites',
          ),
        ]
      ),
    );
  }

}