import 'package:flutter/material.dart';
import 'package:tilawah_tracker/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tilawah Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[900]!),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}