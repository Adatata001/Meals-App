import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory (BuildContext context, Category category) {
    final filteredMeals = dummyMeals.
    where((meal) => meal.categories.contains(category.id))
    .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a Category'),
      ),
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
        children: [
          for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
          _selectCategory(context, category);
            },
          ),
        ],
      ),
    );
  }
}