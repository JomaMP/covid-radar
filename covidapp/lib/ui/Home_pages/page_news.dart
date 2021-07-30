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
      resizeToAvoidBottomInset: false,
      body: Container(
        child: FutureBuilder<NewModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.articles.length,
                // ignore: missing_return
                itemBuilder: (context, index) {
                  if (snapshot.hasData) {
                    var article = snapshot.data.articles[index];
                    if (article.urlToImage != null) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 120,
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
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
                              Flexible(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      article.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      article.content,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  } else
                    return Center(child: CircularProgressIndicator());
                });
          },
        ),
      ),
    );
  }
}
