import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import 'package:mealsapp/screens/meals_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    required this.meals,
    this.title,
    super.key,
    });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailsScreen(
      meal:meal,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, children: [
              Text('Uh oh...nothing here',
               style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                ),),
              SizedBox(height: 16),
              Text('Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        );

      if (meals.isNotEmpty) {
        content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              selectMeal(context, meal);
            },
          ),
        );
      }

      if(title == null) {
        return content;
      }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        ),
        body: content,
      );
    }
  }