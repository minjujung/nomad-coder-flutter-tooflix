import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

// 많은 widget을 블럭 처럼 사용할 수 있음
// 여러 widget을 합쳐서 ui 를 만들어 내는 것
// widget 만드는 것 = class 만드는 것
void main() {
  runApp(const App());
}

// 여기서 App 은 전체 앱의 root widget, 애플리케이션의 시작점
// root widget 은 항상 두개의 옵션 중 하나를 return 해야함
// 1. MaterialApp : 구글 -> 확실히 flutter 자체를 구글에서 만들어서 이걸 대부분 사용
// 2. CupertionApp : 애플
// 앱이 어떤 모습(느낌)으로 보이길 원하는지 정하는 것
class App extends StatelessWidget {
  const App({super.key});

// build method 는 widget 의 ui 를 만드는 역할
// 이 method가 뭘 return 하든 그것을 화면에 띄워줌
// widget(build 결과)을 return 하는 widget(App) 정의중~!
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // const: 수정 불가능, compile 전에 그 value 를 알 수 있는 변수
          // ex) const a = 10;
          //     const b = 15;
          //     var c = a + b; 와 같은 코드가 있으면 dart complier 는 var c = 25 라고 알고 있음
          //     const 는 변하지 않는 값이니 위와 같은 코드에서 a, b에 대한 메모리 공간을 안 만드는 것
          backgroundColor: const Color(0xff181818),
          body: SingleChildScrollView(
            // 스크롤 가능한 화면을 만들어줌
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Hey, Selena',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  // 전구를 클릭하면 widget을 싸고, 빼고를 아주 편하게 할 수 있음 => command + .
                  Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '\$5 194 482',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // div 역할
                      Button(
                          text: 'Transfer',
                          bgColor: Color(0xfff1b33b),
                          textColor: Colors.black),
                      Button(
                          text: 'Request',
                          bgColor: Color(0xff1f2123),
                          textColor: Colors.white),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Wallets',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CurrencyCard(
                    name: 'Euro',
                    code: 'EUR',
                    amount: '6 428!',
                    icon: Icons.euro_rounded,
                    isInverted: false,
                    order: 0,
                  ),
                  const CurrencyCard(
                    name: 'Bitcoin',
                    code: 'BTC',
                    amount: '9 785',
                    icon: Icons.currency_bitcoin,
                    isInverted: true,
                    order: 1,
                  ),
                  const CurrencyCard(
                    name: 'Dollar',
                    code: 'USD',
                    amount: '9 785',
                    icon: Icons.attach_money_outlined,
                    isInverted: false,
                    order: 2,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
