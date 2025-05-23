import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait ({
    required this.icon,
    required this.label,
    super.key
    });

  final IconData icon;
  final String label;

  @override
  Widget build(context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color:Colors.white
          ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          )
        ),
      ],
    );
  }
}