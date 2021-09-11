import 'package:http/http.dart' as http;

class HaberlerApi {
  static Future gethaberler() {
    return http.get(Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=f58b94449b4f45b9844a296497a93747"));
  }
  // NewsService._internal();

  // factory NewsService() {
  //   return _singleton;
  // }

  // static Future<List<Articles>> getNews() async {
  //   final response = await http.get(Uri.parse(
  //       'http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=f58b94449b4f45b9844a296497a93747'));

  //   if (response.body.isNotEmpty) {
  //     final responseJson = json.decode(response.body);
  //     NewsPaper news = NewsPaper.fromJson(responseJson);
  //   }
  //   return null;
  // }
}









// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:news_app/models/news.dart';

// Future<NewsPaper> gethaber() async {
//   final response = await http.get(Uri.parse(
//       'https://api.openweathermap.org/data/2.5/weather?q=London&appid=1c5c2b5da6c093de114b72ab0288751f'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return NewsPaper.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
