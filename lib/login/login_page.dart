import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/login/register_page.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _textControllerName = TextEditingController();
  //TextEditingController _textControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 25.0),
          Column(
            children: <Widget>[
              Image.asset('assets/cupping.png'),
              SizedBox(height: 20.0),
              Text(
                "Nombre completo",
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _textControllerName,
                maxLength: 10,
                decoration: InputDecoration(),
              ),
              SizedBox(height: 12.0),
              Text(
                "Password",
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 15.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("ENTRAR"),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(
                                title: APP_TITLE,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "¿Olvidaste tu password?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30.0),
              Text(
                "¿Ya tienes cuenta?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                child: Text(
                  "REGISTRATE",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              ),
              SizedBox(height: 24.0),
            ],
          ),
        ],
      ),
    );
  }
}
