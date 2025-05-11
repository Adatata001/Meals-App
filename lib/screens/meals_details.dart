import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';



class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen ({
    required this.meal,
    super.key,
    required this.onToggleFavourite,
    }); 

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;


  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed:() {
              onToggleFavourite(meal);
              },
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 14),
            Text('Ingredients',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
             ),
            ),
            SizedBox(height: 14),
            for(final ingredient in meal.ingredients)
             Text(
              ingredient,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 24),
            Text('Steps',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
             ),
            ),
            SizedBox(height: 14),
            for(final step in meal.steps)
             Padding(
               padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
               ),
               child: Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                 ),
               ),
             ),
          ],
        ),
      ),
    );
  }
}