import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold는 screen을 위한 기본적인 layout과 설정 제공
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        title: const Text("오늘 웹툰  📚",
            style: TextStyle(fontWeight: FontWeight.w600)),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
      ),
    );
  }
}
