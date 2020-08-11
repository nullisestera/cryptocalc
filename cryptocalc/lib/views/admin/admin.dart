import 'package:cryptocalc/styles/colors.dart';
import 'package:flutter/material.dart';
import '../drawer/drawerCalc.dart';

 class Admin extends StatelessWidget {
    const Admin({Key key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      
      return Scaffold(
          backgroundColor: ClearBaseColor,
          appBar: AppBar(
            title: Center(
              child: Text('CryptoCalc v2.0'),
            ),
          ),
          body: Center(
            child: Text('Admin'),
          ),
          drawer: Container(
            width: 250,
            child: DrawerCalc()
          )
        );
    }
  }