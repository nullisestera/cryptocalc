import 'package:cryptocalc/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../drawer/drawerCalc.dart';

 class Calc extends StatelessWidget {
    const Calc({Key key}) : super(key: key);
  
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
            child: Text('CALC'),
          ),
          drawer: Container(
            width: 250,
            child: DrawerCalc()
          )
        );
    }
  }


