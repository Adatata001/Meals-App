import 'package:flutter/material.dart';
import 'package:mealsapp/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
} 