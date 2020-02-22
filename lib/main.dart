

import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login/first_page.dart';
import 'package:practica_integradora_uno/utils/constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
      ),
      home: FirstPage()//Home(title: APP_TITLE),

    );
  }
}
