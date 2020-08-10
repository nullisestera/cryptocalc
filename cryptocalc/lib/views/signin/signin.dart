import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: FlanColor,
          body: Center(
            child: Text('SignIn'),
          ),
        );
    }
}
