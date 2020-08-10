import 'package:flutter/material.dart';
import 'styles/colors.dart';
import 'views/calc/calc.dart';
import 'views/login/login.dart';
import 'views/signin/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          "/login": (BuildContext context) => new Login(),
          "/home": (BuildContext context) => new Calc(),
          "/signin": (BuildContext context) => new Signin(),
        },
        initialRoute: "/home",
        title: 'CryptoCalc V2.0',
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          primaryColor: PrimaryColor,
        ),
        home: Calc());
  }
}




