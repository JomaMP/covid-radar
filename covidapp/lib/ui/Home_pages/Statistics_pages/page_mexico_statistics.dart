import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Ticases.dart';

class Tindia extends StatefulWidget {
  @override
  _TindiaState createState() => _TindiaState();
}

class _TindiaState extends State<Tindia> {
  final String url = "https://api.rootnet.in/covid19-in/stats/latest";

  @override
  void initState() {
    super.initState();

    this.getJsonData();
  }

  Future<Ticases> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );

    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body)['data']['summary'];

      return Ticases.fromJson(convertDataJson);
    } else {
      throw Exception('Try to  Reload Page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('México COVID-19 estadísticas'),
        ),
        backgroundColor: Colors.white,
        body: Container(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                    child: ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                      Text(
                        "Casos totales",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Muertes",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("Recuperados",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ]))),
                Padding(padding: EdgeInsets.all(10.0)),
                FutureBuilder<Ticases>(
                    future: getJsonData(),
                    builder: (BuildContext context, SnapShot) {
                      if (SnapShot.hasData) {
                        final covid = SnapShot.data;
                        return Column(children: <Widget>[
                          Card(
                              color: Colors.white,
                              child: ListTile(
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                    Text(
                                      "${covid!.total} ",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${covid.deaths}",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("${covid.discharged}",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                  ])))
                        ]);
                      } else if (SnapShot.hasError) {
                        return Text(SnapShot.error.toString());
                      }

                      return CircularProgressIndicator();
                    }),
              ]),
        )));
  }
}
