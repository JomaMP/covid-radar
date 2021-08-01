import 'dart:convert';
import 'package:covidapp/ui/home.dart';
import 'package:covidapp/ui/registro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = "http://192.168.100.105/pruebas/login.php";
    var response = await http.post(url, body: {
      "email": user.text,
      "contrasena": pass.text,
    });
    debugPrint("Aqui sigo vivo " + user.text + " " + pass.text);
    debugPrint(response.body);
    var data = json.decode(response.body);
    debugPrint("Me muero aqui 0");
    if (data == "Success") {
      debugPrint("Me muero aqui 1");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } else {}
  }

  void registroPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => Registro(),
    ));
  }

  /*void loginPress(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => Home(),
    ));
  }*/

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
                            decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            controller: user),
                        SizedBox(height: 35),
                        TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            controller: pass),
                        SizedBox(height: 15),
                        SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: ElevatedButton(
                            onPressed: () =>
                                login(), //Ejecutara el metodo login
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
