import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

/// StatefulWidget: state 를 써서 data를 보여주는 과정
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<WebtoonModel> webtoons = [];
//   bool isLoading = true;

// // data를 fetch 해서 state 에 넣어주는 것
// // 이렇게 data를 넣기 위한 state 를 사용하므로 stateful widget 사용
// // 하지만 flutter 에서 state 쓰는 것 자체를 그렇게 선호하지 않음
//   void waitForWebtoons() async {
//     webtoons = await ApiService.getTodayToons();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     waitForWebtoons();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Scaffold는 screen을 위한 기본적인 layout과 설정 제공
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 2,
//         title: const Text("오늘 웹툰  📚",
//             style: TextStyle(fontWeight: FontWeight.w600)),
//         foregroundColor: Colors.green,
//         backgroundColor: Colors.white,
//         surfaceTintColor: Colors.white,
//         shadowColor: Colors.black,
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    // Scaffold는 screen을 위한 기본적인 layout과 설정 제공
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          "오늘 웹툰  📚",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: FutureBuilder(
        // stateful widget 사용하지 않고도 data를 보여줄 수 있는 builder
        // await, setState, isLoading 조작 전부 필요 없음
        future: webtoons,
        builder: (context, snapshot) {
          // snapshot은 우리가 정의해놓은 Future 의 상태라고 생각하면 됨
          // snapshot 이름은 바꿀수 있음, 하지만 공식문서에서 snapshot 권장
          if (snapshot.hasData) {
            return const Text('it has data!');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
