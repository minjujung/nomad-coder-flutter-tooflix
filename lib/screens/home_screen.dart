import 'dart:async';

import 'package:flutter/material.dart';

// st 하고 tab 누르면 stateless widget 만들어짐
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 1500;
  bool isRunning = false;

  // Dart 표준 라이브러리에 Timer 있음
  // Timer 를 통해 정해진 간격에 한번씩 함수 실행 가능
  late Timer timer;
  // 사용자가 버튼을 누를때만 이 타이머 생성하도록 => late modifier 사용
  // late modifier 는 이 property 를 당장 초기화 하지 않아도 된다는 것을 의미
  // 하지만 property 를 사용하지 전에는 반드시 초기화 한다는 약속을 뜻하기도 함

  void onTick(Timer timer) {
    setState(() {
      totalSeconds = totalSeconds - 1;
    });
  }

  void onStartPressed() {
    // 1초마다 onTick 함수를 호출
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            // Flextible은 400px 이런식으로 hard coding 하지 않고 비율로 나눠줄 수 있음
            Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '$totalSeconds',
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: IconButton(
                  iconSize: 120,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outlined
                          : Icons.play_circle_outlined,
                      color: Theme.of(context).cardColor),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    // 꽉 채워버리기~
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pomodoros',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
