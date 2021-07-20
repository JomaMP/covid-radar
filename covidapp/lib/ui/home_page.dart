import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset('assets/Media - Avatar.png'),
              const SizedBox(
                height: 50,
              ),
              Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                            decoration: InputDecoration(
                                labelText: "Contraseña",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ))),
                        SizedBox(height: 15),
                        SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.blue[700],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Center(
                              child: Text("Iniciar sesión",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22)),
                            ),
                          ),
                        ),
                        SizedBox(height: 150),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Olvidaste tu contraseña?",
                                  style: TextStyle(color: Colors.blue[700])),
                              Text(" Registrate",
                                  style: TextStyle(color: Colors.blue[700])),
                            ])
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
