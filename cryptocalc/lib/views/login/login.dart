import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: MustardColor,
          body: Center(
            child: Text('LOGIN'),
          ),
        );
    }
}
