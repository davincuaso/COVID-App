import 'package:covid_test_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(onPressed: () async { await _auth.signOut();}, icon: Icon(Icons.person), label: Text('Logout')),
        ],
      ),
    );
  }
}