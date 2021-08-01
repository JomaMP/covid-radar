// @dart=2.9
import 'dart:convert';

import 'package:covidapp/model/newsInfo.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<NewModel> getNews() async {
    var client = http.Client();
    var newsModel = null;

    try {
      var response = await client.get(
          'https://newsapi.org/v2/top-headlines?country=mx&q=covid&apiKey=ee9a8608664e4fdfb89214b897de7553');
      if (response.statusCode == 200 && response.body != null) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewModel.fromJson(jsonMap);
        return newsModel;
      }
    } catch (Exception) {}
  }
}
