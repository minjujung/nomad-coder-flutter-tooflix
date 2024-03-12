import 'package:flutter/material.dart';

// 많은 widget을 블럭 처럼 사용할 수 있음
// 여러 widget을 합쳐서 ui 를 만들어 내는 것
// widget 만드는 것 = class 만드는 것
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  // Widget은 ID 같은 식별자 역할을 하는 key가 있음
  // Flutter는 Widget을 식별하기 위해 ID를 쓴다.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(),
    );
  }
}
