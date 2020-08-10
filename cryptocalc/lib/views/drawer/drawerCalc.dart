import 'package:flutter/material.dart';
import '../../styles/colors.dart';

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
              child: Text('Welcome Fulano')),       
      );
    }
  }

class DrawerCalc extends StatelessWidget {

  _gotoPage(String route, BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  // const DrawerCalc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeaderContainer(),
          new ListTile(
            leading: new Icon(Icons.home),
            title: new Text('Calc'),
            onTap: () {
              // change app state...
              _gotoPage("/home", context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.person),
            title: new Text('Login'),
            onTap: () {
              // change app state...
              _gotoPage("/login", context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.person),
            title: new Text('Signin'),
            onTap: () {
              // change app state...
              _gotoPage("/signin", context);
            },
          ),
        ]
      )
    );
  }
}