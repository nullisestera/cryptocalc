import 'package:flutter/material.dart';
const PrimaryColor = const Color(0xFFF2A900); // 0xFF is #... rest is HEX code

void main() {
  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   const MyApp({Key key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
    

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
        drawer: Container(
          width: 250,
          child: DrawerCalc()
        )
       )
     );
   }
 }

 class DrawerHeaderContainer extends StatelessWidget {
   const DrawerHeaderContainer({Key key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Container(
       height: 80,
       child: DrawerHeader(
            decoration: BoxDecoration(
              color: PrimaryColor
            ),
            child: Text('Welcome Fulano'),)
     );
   }
 }

class DrawerCalc extends StatelessWidget {
  const DrawerCalc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeaderContainer()
        ]
      )
    );
  }
}


