import 'package:flutter/material.dart';
import 'package:news_app/services/api_service.dart';

// import 'customListTile.dart';
import 'customListTile.dart';
import 'models/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),

      //Now let's call the APi services with futurebuilder wiget
      //Şimdi futurebuilder wiget'ı ile API servislerini çağıralım
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          //cevap alıp almadığımızı kontrol edelim
          if (snapshot.hasData) {
            //Now let's make a list of articles
            //Şimdi makalelerin bir listesini yapalım
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              //Şimdi özel Liste kutumuzu oluşturalım
              itemCount: articles!
                  .length, //gelen veri kadar kutucuk olsun anlamına geliyor
              itemBuilder: (context, index) => customListTile(articles[index],
                  context), //customlistile sayfasına articlesin indexini ve contex i gönder
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
