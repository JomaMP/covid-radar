// @dart=2.9
import 'package:covidapp/services/api_manager.dart';
import 'package:covidapp/model/newsInfo.dart';
import 'package:flutter/material.dart';

class PageNews extends StatefulWidget {
  @override
  _PageNewsState createState() => _PageNewsState();
}

class _PageNewsState extends State<PageNews> {
  Future<NewModel> _newsModel;
  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<NewModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    var article = snapshot.data.articles[index];
                    return Container(
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                article.urlToImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else
                    return Center(child: CircularProgressIndicator());
                });
          },
        ),
      ),
    );
  }
}
