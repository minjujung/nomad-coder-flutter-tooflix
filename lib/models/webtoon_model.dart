class WebtoonModel {
  final String title, thumb, id;

  // named constructor: 이름이 있는 contructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'], // 받아온 json으로 title, thumb, id를 초기화
        thumb = json['thumb'],
        id = json['id'];
}
