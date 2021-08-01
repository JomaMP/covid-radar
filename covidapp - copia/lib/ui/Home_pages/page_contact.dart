import 'package:flutter/material.dart';

class PageContact extends StatefulWidget {
  @override
  _PageContactState createState() => _PageContactState();
}

class _PageContactState extends State<PageContact> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Aguascalientes", "phone": 4499107900},
    {"id": 2, "name": "Baja California", "phone": 6863048048},
    {"id": 3, "name": "Baja California Sur", "phone": 6121995386},
    {"id": 4, "name": "Campeche", "phone": 911},
    {"id": 5, "name": "Chiapas", "phone": 8007722020},
    {"id": 6, "name": "Chihuahua", "phone": 6144293300},
    {"id": 7, "name": "Ciudad de México", "phone": 5556581111},
    {"id": 8, "name": "Coahuila", "phone": 911},
    {"id": 9, "name": "Colima", "phone": 8003372583},
    {"id": 10, "name": "Durango", "phone": 6181377306},
    {"id": 11, "name": "Estado de México", "phone": 8009003200},
    {"id": 12, "name": "Guanajuato", "phone": 8006272583},
    {"id": 13, "name": "Guerrero", "phone": 7474711863},
    {"id": 14, "name": "Hidalgo", "phone": 7717194500},
    {"id": 15, "name": "Jalisco", "phone": 3338233220},
    {"id": 16, "name": "Michoacán", "phone": 8001232890},
    {"id": 17, "name": "Morelos", "phone": 7773143336},
    {"id": 18, "name": "Nayarit", "phone": 3112179556},
    {"id": 19, "name": "Nuevo León", "phone": 8183610058},
    {"id": 20, "name": "Oaxaca", "phone": 9515161220},
    {"id": 21, "name": "Puebla", "phone": 8004205782},
    {"id": 22, "name": "Querétaro", "phone": 4421015205},
    {"id": 23, "name": "Quintana Roo", "phone": 8008329198},
    {"id": 24, "name": "San Luis Potosí", "phone": 8001238888},
    {"id": 25, "name": "Sinaloa", "phone": 6677130063},
    {"id": 26, "name": "Sonora", "phone": 6622162759},
    {"id": 27, "name": "Tabasco", "phone": 8006241774},
    {"id": 28, "name": "Tamaulipas", "phone": 8343186320},
    {"id": 29, "name": "Tlaxcala", "phone": 911},
    {"id": 30, "name": "Veracruz", "phone": 8000123456},
    {"id": 31, "name": "Yucatán", "phone": 8009822826},
    {"id": 32, "name": "Zacatecas", "phone": 8009672583},
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(width: 1, color: Colors.blue),
                    ),
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.length > 0
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.white10,
                        elevation: 0,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Icon(Icons.phone),
                          title: Text(_foundUsers[index]['name']),
                          subtitle:
                              Text('${_foundUsers[index]["phone"].toString()}'),
                        ),
                      ),
                    )
                  : Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
