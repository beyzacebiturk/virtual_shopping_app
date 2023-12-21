import 'package:flutter/material.dart';
import 'package:virtual_shopping_app/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Shopping App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 236, 144, 175)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}