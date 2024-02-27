import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

// 많은 widget을 블럭 처럼 사용할 수 있음
// 여러 widget을 합쳐서 ui 를 만들어 내는 것
// widget 만드는 것 = class 만드는 것
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFE7626C),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}
