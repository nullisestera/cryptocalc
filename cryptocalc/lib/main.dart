import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({Key key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     const PrimaryColor = const Color(0xFFF2A900); // 0xFF is #... rest is HEX code

     return MaterialApp(
       title: 'CryptoCalc v2.0',
       theme: ThemeData(primaryColor: PrimaryColor),
       home: Scaffold(
         appBar: AppBar(
           title: Center(
             child: Text('CryptoCalc v2.0'),
           ),
         ),
         body: Center(
          child: Text('Hello World'),
        ),
        drawer: Drawer(),
       )
     );
   }
 }

class Drawer extends StatelessWidget {
  const Drawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Text('STATELESS SEPARADO')
      )
    );
  }
}


