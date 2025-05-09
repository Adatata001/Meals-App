import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen ({
    required this.meal,
    super.key,
    });

  final Meal meal;


  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meal.title'),
      ),
      body: Image.network(
        meal.imageUrl,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}