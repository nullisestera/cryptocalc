import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../views/calc/calc.dart';
import '../../views/signin/signin.dart';
import '../../views/passwordRecovery/passwordRecovery.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../api/auth.dart';
import '../../i18n/app_localizations.dart';

class Login extends StatefulWidget {

  Login({Key key}) : super(key: key);

  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  String _password;
  String _email;

  Widget build(BuildContext context) {

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    //ELEMENTS
    final emailField = Container(
      width: 240.0,
      child: TextFormField(
      validator: (value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).translate('loginEmailValidation');
            }
            return null;
      },  
      onSaved: (value) => _email = value,
      keyboardType: TextInputType.emailAddress, 
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: AppLocalizations.of(context).translate('loginEmail'),
          ),
      )
    );
    

    final passwordField = Container(
      width: 240.0,
      child: TextFormField(
      validator: (value) {
            if (value.isEmpty) {
              return AppLocalizations.of(context).translate('loginPassValidation');
            }
            return null;
      },
      obscureText: true,
      onSaved: (value) => _password = value,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: AppLocalizations.of(context).translate('loginPass'),
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
        onPressed: () async {
          // save the fields..
          final form = _formKey.currentState;
          form.save();

          // Validate will return true if is valid, or false if invalid.
          if (form.validate()) {
              try {
                FirebaseUser result =
                    await Provider.of<AuthService>(context).loginUser(
                        email: _email, password: _password);

              String emailFirebase = result.providerData[0].email;

              

              if(emailFirebase == "$_email"){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calc()),
                );
              }  

              } on AuthException catch (error) {
                return _buildErrorDialog(context, error.message);
              } on Exception catch (error) {
                return _buildErrorDialog(context, error.toString());
              }
            }
        },
        child: Text(AppLocalizations.of(context).translate('loginSubmit'),
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
        child: Text(AppLocalizations.of(context).translate('loginRecoveryPass'), style: TextStyle(
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
        child: Text(AppLocalizations.of(context).translate('loginGoToSignin'), style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                  ),),
      ),
    )
    );

      return Scaffold(
        resizeToAvoidBottomInset: false,
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
            child: Text(AppLocalizations.of(context).translate('loginTitle'),
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
            child: Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 180.0),
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
                Text(AppLocalizations.of(context).translate('loginForgotPass'), style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w200,
                  fontSize: 16
                ),),
                recoveryPasswordLink,  
                SizedBox(
                  height: 12.0,
                ),
                Text(AppLocalizations.of(context).translate('loginGoToSigninQuestion'), style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w200,
                  fontSize: 16
                ),),
                registerLink  
              ],
            ),
            
            )
          )
          )
        ],)
        );
    }
}

Future _buildErrorDialog(BuildContext context, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).translate('loginError')),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text(AppLocalizations.of(context).translate('loginCancel')),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }