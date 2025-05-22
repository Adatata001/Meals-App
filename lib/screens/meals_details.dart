import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/provider/favourite_provider.dart';



class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen ({
    required this.meal,
    super.key,
    }); 

  final Meal meal;



  @override
  Widget build(context, WidgetRef ref) {

    final favouriteMeals = ref.watch(favouriteMealsProvider);

    final isFavourite = favouriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed:() {
              final wasAdded = ref
               .read(favouriteMealsProvider.notifier)
               .toggleMealFavouriteStatus(meal);
             ScaffoldMessenger.of(context).clearSnackBars();
             ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                  content: Text(
                    wasAdded ? 'Meal added to Favourite' 
                    : 'Meal removed from Favourite'
                  ),
                )
              );
            },
            icon: Icon(
              isFavourite ? Icons.star 
              : Icons.star_border
            ),
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
              color: Theme.of(context).colorScheme.onSurface,
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
                  color: Theme.of(context).colorScheme.onSurface,
                 ),
               ),
             ),
          ],
        ),
      ),
    );
  }
}