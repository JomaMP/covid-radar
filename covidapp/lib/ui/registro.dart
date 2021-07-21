import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
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
                                ))),
                        SizedBox(height: 35),
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Correo",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ))),
                        SizedBox(height: 35),
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Telefono",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ))),
                        SizedBox(height: 35),
                        TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Fecha de nacimiento",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ))),
                        SizedBox(height: 35),
                        TextField(
                            decoration: InputDecoration(
                                labelText: "Contraseña",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ))),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: ElevatedButton(
                            onPressed: () {},
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
