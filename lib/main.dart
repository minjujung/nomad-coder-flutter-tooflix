import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

// 많은 widget을 블럭 처럼 사용할 수 있음
// 여러 widget을 합쳐서 ui 를 만들어 내는 것
// widget 만드는 것 = class 만드는 것
void main() {
  runApp(const App2());
}

// 여기서 App 은 전체 앱의 root widget, 애플리케이션의 시작점
// root widget 은 항상 두개의 옵S션 중 하나를 return 해야함
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

// 위젯에 데이터를 저장하고 싶고 실시간으로 업데이트 하고 싶을 때 Stateful widget 을 사용
// Stateful widget 은 두 부분으로 나뉨 : 1. widget 2. state(data 와 ui 를 넣는 곳)
class App2 extends StatefulWidget {
  const App2({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App2> {
  int counter = 0;
  List<int> numbers = [];

  // dispose 사용 예시
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  void onClicked() {
    // setState 를 호출하면 -> 새로운 data가 있다는걸 flutter 에게 알려줌
    // flutter 는 build method 를 호출해서 ui 를 다시 그림
    // state는 그렇게 많이 사용되지는 않음
    setState(() {
      counter++;
    });

    // 사실 아래와 같이 setState 안에 counter++ 를 안 넣어도 됨
    // 왜냐면 상태를 바꾸고 바뀐걸 알려주기만 하면 되기 때문
    // setState를 호출 할 때 마다 build method 가 다시 실행됨
    // counter++;
    // setState(() {});
  }

  void onAdd() {
    // numbers.add(numbers.length);
    // print('numbers: $numbers');
    setState(() {
      numbers.add(numbers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.yellow[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('nothing!'),
              Text('$counter', style: const TextStyle(fontSize: 30)),
              IconButton(
                onPressed: onClicked,
                icon: const Icon(Icons.add_box_rounded),
                iconSize: 40,
              ),
              for (var number in numbers) Text('$number'),
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add_box_rounded),
                iconSize: 40,
                color: Colors.orange,
              ),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// initState, build, dispose 로 lifecycle 관리
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  // 1. state 를 단순하게 init 하는 방법
  int count = 0;

  // 2. state 를 method를 사용해서 init 하는 방법
  // - 대부분 1번으로 가능
  // - 2번은 부모요소에 의존하는 data를 초기화 해야할 때 사용
  // - initState method는 항상 build method 전에 호출됨
  // - initState method는 딱 한번만 호출됨
  // - initState method를 사용할 때는 super.initState() 를 꼭 호출해야함
  @override
  void initState() {
    super.initState();
    print('init');
  }

// 위젯이 스크린에서 사라질 때 호출됨
// 위젯이 위젯 트리에서 사라질 때 뭔가 취소하고 싶으면 사용
// 여기서는 MyTitleWidget 이 사라질 때 이 method가 호출됨
  @override
  void dispose() {
    super.dispose();
    print('dispose'); // api 업데이트 / 이벤트 리스너 구독 취소 / form 리스너에서 벗어 나고 싶을 때
  }

  @override
  // BuildContext 는 widget tree 의 정보를 가지고 있음
  // 이걸로 매우 먼 부모요소도 접근 가능
  // 애플리케이션안에서 이 위젯의 위치 정보를 알려줌
  Widget build(BuildContext context) {
    print('hello3');
    return Text(
      'My Large Title',
      style: TextStyle(
          // titleLarge에 color가 없을 수 있기 때문에 color가 꼭 있다고 알려주는 것이 '!'
          // 또는 color가 없을 수도 있다고 알려주고 있을 때만 사용해라는 의미가 '?'
          // 둘중에 하나는 사용해야함. 안그러면 에러남
          // (The property 'color' can't be unconditionally accessed because the receiver can be 'null'.
          // Try making the access conditional (using '?.') or adding a null check to the target ('!').))
          fontSize: 30,
          // 이런 식으로 먼 부모에서 정의한 theme을 쉽게 가져와서 사용 가능
          color: Theme.of(context).textTheme.titleLarge!.color),
    );
  }
}
