import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class PasswordRecovery extends StatefulWidget {
  PasswordRecovery({Key key}) : super(key: key);

  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MustardColor,
                  FlanColor,
                  FlanLightColor
                ],
                stops: [0.1, 0.9, 1.5]
              )
            )
          ),
          Container(
            height: 180.0,
            width: 320.0,
            child: Image.asset('assets/images/crypto.png'),
            margin: const EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0, bottom: 50.0),
          ),
          Center(child: 
            Container(
            height: 240.0,
            width: 320.0,
            margin: const EdgeInsets.only(top: 80.0),
            decoration: BoxDecoration(
              color: FlanLightColor,
              borderRadius: BorderRadius.circular(25)
            ),
          )
          ),
          Container(
            height: 80.0,
            width: 320.0,
            child: Text('Recupera tu contraseña',
              textAlign: TextAlign.center, 
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
            ),
            margin: const EdgeInsets.only(left: 120.0, right: 120.0, top: 300.0, bottom: 150.0),
          ),
        ],)
        );
    }
}
