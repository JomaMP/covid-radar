import 'package:covidapp/ui/home.dart';
import 'package:covidapp/ui/registro.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  void registroPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => Registro(),
    ));
  }

  void loginPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => Home(),
    ));
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
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: ElevatedButton(
                            onPressed: () => loginPress(context),
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
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Color(0xFF1976D2)),
                                ),
                                onPressed: () {},
                                child: const Text('Olvidaste tu contraseña?'),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Color(0xFF1976D2)),
                                ),
                                onPressed: () => registroPress(context),
                                child: const Text('Registrate'),
                              ),
                            ])
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
