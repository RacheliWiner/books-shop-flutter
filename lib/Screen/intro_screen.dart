import 'package:books_app/Screen/home_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  final VoidCallback toggleDarkMode;
  final bool isDarkMode;

  IntroScreen({required this.toggleDarkMode, required this.isDarkMode});

  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome", 
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleDarkMode,
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'images/10.jpg', // מקור התמונה מתוך הפרויקט
              width: 300,
              height: 400,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 150,
              right: 30,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen(
                      toggleDarkMode: widget.toggleDarkMode,
                      isDarkMode: widget.isDarkMode,
                    )),
                  );
                },
                child: Text(
                  "Let's start our journey!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
