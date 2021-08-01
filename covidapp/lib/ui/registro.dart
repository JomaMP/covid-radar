import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covidapp/ui/login.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController user = TextEditingController();
  TextEditingController celphone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register() async {
    var url = "http://192.168.100.105/pruebas/registro.php";
    var response = await http.post(url, body: {
      "usuario": user.text,
      "telefono": celphone.text,
      "email": email.text,
      "contrasena": pass.text,
    });

    debugPrint(user.text +
        "  " +
        celphone.text +
        "  " +
        email.text +
        "  " +
        pass.text);
    debugPrint(response.body);
    var data = json.decode(response.body);
    if (data == "Error") {
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset('assets/Media - Avatar.png'),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Nombre Completo",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                            controller: user),
                        SizedBox(height: 35),
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Correo",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                            controller: email),
                        SizedBox(height: 35),
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Telefono",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                            controller: celphone),
                        SizedBox(height: 35),
                        /*TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Fecha de nacimiento",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ))),
                        SizedBox(height: 35),*/
                        TextField(
                            decoration: InputDecoration(
                                labelText: "Contraseña",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                            controller: pass),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: ElevatedButton(
                            onPressed: () {
                              register();
                            },
                            child: Center(
                              child: Text("Registrar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                            ),
                          ),
                        ),
                        SizedBox(height: 150),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
