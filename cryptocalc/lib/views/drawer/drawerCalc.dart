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
                color: MustardColor
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
            leading: new Icon(Icons.keyboard),
            title: new Text('Calc'),
            onTap: () {
              // change app state...
              _gotoPage("/home", context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.monetization_on),
            title: new Text('Trade'),
            onTap: () {
              // change app state...
              _gotoPage("/trade", context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.show_chart),
            title: new Text('Graph'),
            onTap: () {
              // change app state...
              _gotoPage("/graph", context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.payment),
            title: new Text('Pay'),
            onTap: () {
              // change app state...
              _gotoPage("/pay", context);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.account_circle),
            title: new Text('Admin'),
            onTap: () {
              // change app state...
              _gotoPage("/admin", context);
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 10,
            thickness: 1,
            endIndent: 0,
          ),
          new ListTile(
            leading: new Icon(Icons.exit_to_app),
            title: new Text('Logout'),
            onTap: () {
              // change app state...
              _gotoPage("/login", context);
            },
          ),
        ]
      )
    );
  }
}