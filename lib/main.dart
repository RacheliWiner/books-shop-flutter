import '../Model/model.dart';
import 'package:flutter/material.dart';
import 'Screen/login_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;
  void toggleDarkMode(){
    setState(() {
      isDarkMode =!isDarkMode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode? ThemeData.dark() : ThemeData.light(),
      home: LoginScreen(
        isDarkMode: isDarkMode,
        toggleDarkMode: toggleDarkMode,
      )
    );
  }
}
List<Book> cart = [];