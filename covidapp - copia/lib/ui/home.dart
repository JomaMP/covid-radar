import 'package:covidapp/ui/Home_pages/page_contact.dart';
import 'package:covidapp/ui/Home_pages/page_news.dart';
import 'package:flutter/material.dart';

import 'Home_pages/page_map.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _paginaActual = 0;

  List<Widget> _paginas = [PageMapa(), PageNews(), PageContact()];
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
            label: 'Mapa',
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
