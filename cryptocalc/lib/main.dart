
import 'package:flutter/material.dart';
import 'styles/colors.dart';
// Pages
import 'views/calc/calc.dart';
import 'views/trade/trade.dart';
import 'views/graph/graph.dart';
import 'views/pay/pay.dart';
import 'views/admin/admin.dart';
// Auth
import 'views/passwordRecovery/passwordRecovery.dart';
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
          // AUTH
          "/login": (BuildContext context) => new Login(),
          "/signin": (BuildContext context) => new Signin(),
          "/passwordRecovery": (BuildContext context) => new PasswordRecovery(),
          // PAGES
          "/home": (BuildContext context) => new Calc(),
          "/trade": (BuildContext context) => new Trade(),
          "/graph": (BuildContext context) => new Graph(),
          "/pay": (BuildContext context) => new Pay(),
          "/admin": (BuildContext context) => new Admin(),
        },
        initialRoute: "/login",
        title: 'CryptoCalc V2.0',
        theme: ThemeData(
          fontFamily: 'Lato',
          // primarySwatch: Colors.blue,
          primaryColor: MustardColor,
        ),
        home: Calc());
  }
}




