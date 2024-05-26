import 'package:adigau/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: const Color(0xFFF6E9B2),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFF3CA52),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFF0A6847),
      ),
      home: HomeScreen(),
    );
  }
}
