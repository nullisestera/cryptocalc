import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../views/calc/calc.dart';
import '../../views/signin/signin.dart';
import '../../views/passwordRecovery/passwordRecovery.dart';


class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    //ELEMENTS
    final emailField = Container(
      width: 240.0,
      child: TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          ),
      )
    );
    

    final passwordField = Container(
      width: 240.0,
      child: TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          ),
      )
    );

    final loginButon = Padding(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
      child:Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: MustardColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Calc()),
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
      ),
    )
    );

    final recoveryPasswordLink = Padding(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
      child:Material(
      color: Colors.transparent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PasswordRecovery()),
          );
        },
        child: Text('Recuperar Contraseña', style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),),
      ),
    )
    );
    

    final registerLink = Padding(
      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
      child:Material(
      color: Colors.transparent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signin()),
          );
        },
        child: Text('¡REGÍSTRATE!', style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),),
      ),
    )
    );

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
            height: 480.0,
            width: 320.0,
            margin: const EdgeInsets.only(top: 100.0),
            decoration: BoxDecoration(
              color: FlanLightColor,
              borderRadius: BorderRadius.circular(25)
            ),
          )
          ),
          Container(
            height: 180.0,
            width: 350.0,
            child: Text('Ingresa',
              textAlign: TextAlign.center, 
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 36,
                fontWeight: FontWeight.w600
              ),
            ),
            margin: const EdgeInsets.only(left: 120.0, right: 120.0, top: 180.0),
          ),
          Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 140.0),
                emailField,
                SizedBox(height: .0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
                Text('¿Olvidaste tu contraseña?', style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w200,
                  fontSize: 16
                ),),
                recoveryPasswordLink,  
                SizedBox(
                  height: 12.0,
                ),
                Text('¿No tienes cuenta?', style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w200,
                  fontSize: 16
                ),),
                registerLink  
              ],
            ),
          )
          )
        ],)
        );
    }
}
