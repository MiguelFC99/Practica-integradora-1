import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/login/login_page.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _textControllerName = TextEditingController();
  TextEditingController _textControllerEmail = TextEditingController();
  TextEditingController _textControllerPassword = TextEditingController();
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 25.0),
            Column(
              children: <Widget>[
                Image.asset('assets/cupping.png'),
                SizedBox(height: 20.0),
                Text("Nombre completo",style: TextStyle(color: Colors.white),),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: '_',
                  ),
                  controller: _textControllerName,
                  maxLength: 20,
                ),
                SizedBox(height: 12.0),
                Text("Email",style: TextStyle(color: Colors.white),),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: '_',
                  ),
                  controller: _textControllerEmail,
                  maxLength: 30,
                  obscureText: true,
                ),
                SizedBox(height: 12.0),
                Text("Password",style: TextStyle(color: Colors.white),),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: '_',
                  ),
                  obscureText: true,
                  controller: _textControllerPassword,
                  maxLength: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.check_circle,color: valor?Colors.white:Colors.black,),
                      onPressed: () {
                        setState(() {
                          valor = !valor;
                        });
                      },
                    ),
                    Text("Acepto los términos y condiciones",style: TextStyle(color: Colors.white),)
                  ],
                ),
                SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text("REGISTRATE"),
                          onPressed: () {
                            Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home(title: APP_TITLE,)),
                        );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text("¿Ya tienes cuenta?",style: TextStyle(color: Colors.white),),
                SizedBox(height: 10.0),
                GestureDetector(child: Text("INGRESA",style: TextStyle(color: Colors.white),),onTap: (){
                  Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                },),
                SizedBox(height: 24.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
