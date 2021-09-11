//Now let's create the article details page

import 'package:flutter/material.dart';

import 'models/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title
            .toString()), //sayfanın başlığını gelen detay haberinin başlığı
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(8.0), //içeriğe kenar boşlukları veriyoruz.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //konteynr oluşturuyoruz
              height: 200.0, //yüksekliği 200
              width: double.infinity, //genişliği max olarak ayarlıyoruz.
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: NetworkImage(article.urlToImage
                        .toString()), //articles den gelen detay fotosunu burada veriyoruz
                    fit: BoxFit.cover), //fotoğrafı ekrana sığdırıyoruz
                borderRadius:
                    BorderRadius.circular(12.0), //fotoğrafa köşelik veriyoruz
              ),
            ),
            SizedBox(
              height:
                  10.0, //yazı için fotoğraf ile yazı arasında yükseklik/boşluk veriyoruz
            ),
            Container(
              padding: EdgeInsets.all(
                  6.0), //yazı için her taraftan 6 lık boşluk veriyoruz
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Text(
                article.source!.name.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              article.description.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
