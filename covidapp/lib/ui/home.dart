import 'package:covidapp/ui/Home_pages/page_contact.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:covidapp/ui/Home_pages/page_news.dart';
import 'package:covidapp/ui/Home_pages/page_statistics.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _paginaActual = 0;

  List<Widget> _paginas = [PageStatistics(), PageNews(), PageContact()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CovidApp"),
      ),
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Estadísticas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Contacto',
          ),
        ],
        selectedItemColor: Colors.blue[700],
      ),
      backgroundColor: Colors.white,
    );
  }
}
