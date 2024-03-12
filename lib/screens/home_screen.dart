import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold는 screen을 위한 기본적인 layout과 설정 제공
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Toons"),
      ),
    );
  }
}
