import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/main_drawer.dart';
import 'package:mealsapp/screens/filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/favourite_provider.dart';
import 'package:mealsapp/provider/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
  Filter.lactoseFree: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});


  @override
  ConsumerState<TabsScreen> createState() => _TabsScreen();
}


class _TabsScreen extends ConsumerState<TabsScreen> {

  int _selectedPageIndex = 0;




  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
      Navigator.of(context).pop();
    if(identifier == 'filters') {
     await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(context) {

    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage  = CategoriesScreen(
      availableMeals: availableMeals,
      );
    var activePageTitle = 'Category';

    if(_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        meals: favouriteMeals,
        
        );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle)
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
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