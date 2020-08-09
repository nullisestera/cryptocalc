import 'package:flutter/material.dart';
const PrimaryColor = const Color(0xFFF2A900); // 0xFF is #... rest is HEX code

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