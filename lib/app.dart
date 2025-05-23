import 'package:flutter/material.dart';
import 'package:mealsapp/screens/tabs.dart';
import 'package:google_fonts/google_fonts.dart';



final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 52, 23, 1),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: TabsScreen(),
    );
  }
}