import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE

  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(
        "http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=f58b94449b4f45b9844a296497a93747")); //api linkini http(response) değişkenindeki res değişkenine atıyoruz
    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      //eğer gelen cevapta veri varsa
      Map<String, dynamic> json = jsonDecode(res
          .body); //map string dynamic türündeki json değişkenine decode ederek bodsini at(jsondecode json u ayıklar)

      List<dynamic> body =
          json['articles']; //ist dynamic body değişkenşne jsonu at

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles = body
          .map((dynamic item) => Article.fromJson(item))
          .toList(); //bu satır, json dosyasından farklı makaleleri almamızı ve bunları bir listeye koymamızı sağlayacak.

      return articles; //articles i geri döndür. bu clasa başka yerden çağırdığımda gelen veriyi ifade eder
    } else {
      throw ("Can't get the Articles");
    }
  }
}
