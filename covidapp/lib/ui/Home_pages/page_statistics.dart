import 'package:covidapp/ui/Home_pages/Statistics_pages/page_hospital_statistics.dart';
import 'package:covidapp/ui/Home_pages/Statistics_pages/page_mexico_statistics.dart';
import 'package:covidapp/ui/Home_pages/page_faqs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Tcases.dart';
import 'Statistics_pages/page_states_statistics.dart';
import 'Statistics_pages/page_countries_statistics.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';
import 'Statistics_pages/page_hospital_states_statistics.dart';

class PageStatistics extends StatefulWidget {
  @override
  _PageStatistics createState() => _PageStatistics();
}

class _PageStatistics extends State<PageStatistics> {
  final String url = "https://corona.lmao.ninja/v3/covid-19/all";

  void faqsPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => PageFaqs(),
    ));
  }

  navigateToWHO(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Text('Link is not Working $url');
    }
  }

  navigateToIndia() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Tindia()));
  }

  navigateToIndiaMap() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => India()));
  }

  navigateToWorld() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => World()));
  }

  navigateToHospital() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Hospital()));
  }

  navigateToHstate() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Hstate()));
  }

  @override
  void initState() {
    super.initState();

    this.getJsonData();
  }

  Future<Tcases> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );

    if (response.statusCode == 200) {
      final convertDataJson = jsonDecode(response.body);

      return Tcases.fromJson(convertDataJson);
    } else {
      throw Exception('Try to  Reload Page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
              child: Container(
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: ElevatedButton(
                    onPressed: () => faqsPress(context),
                    child: Text(
                      "Preguntas frecuentes",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ])))),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Estadísticas del mundo',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                // ignore: deprecated_member_use
                ElevatedButton(
                  onPressed: () => navigateToIndia(),
                  child: Text('Estadísticas de México',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                )
              ]),
          FutureBuilder<Tcases>(
              future: getJsonData(),
              builder: (BuildContext context, SnapShot) {
                if (SnapShot.hasData) {
                  final covid = SnapShot.data;
                  return Column(children: <Widget>[
                    Card(
                        child: ListTile(
                            title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                          Text(
                            "${covid!.cases} ",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${covid.deaths}",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("${covid.recovered}",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold)),
                        ]))),
                    Card(
                        child: ListTile(
                            title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                          Text(
                            "Casos totales ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Deaths",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("Recoveries",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ]))),
                  ]);
                } else if (SnapShot.hasError) {
                  return Text(SnapShot.error.toString());
                }

                return CircularProgressIndicator();
              }),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                        child: Container(
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Image(
                            image: AssetImage(
                                "assets/statistics_images/india.png"),
                            height: 80,
                            width: 80,
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          // ignore: deprecated_member_use
                          ElevatedButton(
                            onPressed: () => navigateToIndiaMap(),
                            child: Text(
                              "Estadisticas estatales",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ])))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Card(
                        child: Container(
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          Image(
                            image: AssetImage(
                                "assets/statistics_images/world.png"),
                            height: 80,
                            width: 80,
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          ElevatedButton(
                            onPressed: () => navigateToWorld(),
                            child: Text(
                              "Estadísticas por países",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ])))),
                  ),
                ])),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                Card(
                    child: Container(
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Image(
                        image:
                            AssetImage("assets/statistics_images/hospital.png"),
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      ElevatedButton(
                        onPressed: () => navigateToHospital(),
                        child: Text(
                          "Estadísticas de hospitales",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ])))),
                Card(
                    child: Container(
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Image(
                        image: AssetImage("assets/statistics_images/hs.png"),
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      ElevatedButton(
                        onPressed: () => navigateToHstate(),
                        child: Text(
                          "Estadísticas de Hospitales \npor Estado",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ])))),
              ])),
        ],
      )),
    )));
  }
}
