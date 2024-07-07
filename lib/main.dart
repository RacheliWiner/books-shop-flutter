import 'package:books_app/Model/model.dart';
import 'package:books_app/Screen/intro_screen.dart';
import 'package:flutter/material.dart';
import 'Screen/intro_screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
        home: IntroScreen(
          isDarkMode: isDarkMode,
          toggleDarkMode: toggleDarkMode,
        ));
  }
}

List<Book> cart = [];
