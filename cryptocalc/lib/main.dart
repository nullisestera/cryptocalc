
import 'package:flutter/material.dart';
import 'styles/colors.dart';
import 'styles/loader.dart';
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'api/login_auth.dart';

void main() => runApp(
  ChangeNotifierProvider<AuthService>(
    child: MyApp(),
    builder: (BuildContext context) {
      return AuthService();
    },
  )
);

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder<FirebaseUser>(
          future: Provider.of<AuthService>(context).getUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // log error to console 
              if (snapshot.error != null) { 
                print("error");
                return Text(snapshot.error.toString());
              }

              // redirect to the proper page
              return snapshot.hasData ? Calc() : Login();
            } else {
              // show loading indicator
              return LoadingCircle();
            }
          },
        ),
        routes: <String, WidgetBuilder>{
          // AUTH
          /*"/home": (BuildContext context){
            if(loggedIn){
              return Calc();
            } else {
              return Login();
            }
          },*/
          "/login": (BuildContext context) => new Login(),
          "/signin": (BuildContext context) => new Signin(),
          "/passwordRecovery": (BuildContext context) => new PasswordRecovery(),
          // PAGES
          //"/home": (BuildContext context) => new Calc(),
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
        )
        /*home: Calc()*/);
  }
}




