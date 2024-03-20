import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

// final: 런타임에 값 할당 받을 수 있음 & 값이 할당되면 변경 불가능
// const: 컴파일 타임에 값 결정, 런타임에서 값 변경 불가능
class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  // 변하는 state 가 없는 경우에는 static으로 선언
  static Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> webtoonInstances = [];

    //대부분의 HTTP 클라이언트 라이브러리들은 Uri 객체를 요구
    //문자열 형태의 URL을 Uri 객체로 변환
    final url = Uri.parse('$baseUrl/$today');

    // pub.dev 라는 Dart, Flutter 공식 패키지 보관소 => node.js의 npm과 같은 역할
    // https://pub.dev/packages/http/install => http install 하기
    final response = await http.get(url);
    // API 요청이 처리돼서 응답을 반환할 때 까지 기다리기 => async programming
    // getTodayToons 함수를 실행했을 때 요청만 하고 넘어가지 않음!
    // 기다려야 되는 것 앞에 await, await은 async 함수 내에서만 가능
    // Future 타입은 현재가 아닌 미래에 받을 결과 값의 타입 알려주는 것!!
    // Future<Response>: 나중에 완료되고 완료되었을 때는 Response를 반환

    if (response.statusCode == 200) {
      // => Json string 형태의 데이터를 Dart 에서 쓸 수 있는 데이터 형식인 class로 하나하나 바꿔줘야 함
      // 먼저 JSON 형식으로 바꿔주기
      final List<dynamic> webtoons = jsonDecode(response
          .body); // jsonDecode 반환하는 값의 기본 type 이 dynamic(아무것이나 다 될 수 있는 타입)
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
