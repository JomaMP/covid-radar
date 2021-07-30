import 'dart:convert';

import 'package:http/http.dart';
import '../model/article_model.dart';

class ApiService{

  final endPointUrl =
  "https://newsapi.ai/api/v1/article/getArticles?query=%7B%22%24query%22%3A%7B%22%24and%22%3A%5B%7B%22conceptUri%22%3A%22http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FCoronavirus%22%7D%2C%7B%22locationUri%22%3A%22http%3A%2F%2Fen.wikipedia.org%2Fwiki%2FMexico%22%7D%5D%7D%2C%22%24filter%22%3A%7B%22forceMaxDataTimeWindow%22%3A%2231%22%2C%22dataType%22%3A%5B%22news%22%5D%7D%7D&resultType=articles&articlesSortBy=date&articlesCount=100&articleBodyLen=-1&apiKey=8408b494-1634-460e-acaa-96282bb4bec3&callback=JSON_CALLBACK";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    //first of all let's check that we got a 200 statu code: this mean that the request was a succes
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}