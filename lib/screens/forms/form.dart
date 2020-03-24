import 'package:covid_test_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_test_app/services/database.dart';
import 'package:covid_test_app/models/form.dart';

class FormScreen extends StatelessWidget {

  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //this reflects the form results
    return StreamProvider<List<FormResult>>.value(
      value: DataBaseService().forms,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Form Screen'),
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(onPressed: () async { await _auth.signOut();}, icon: Icon(Icons.person), label: Text('Logout')),
            ],
          ),
          //make the HealthReport function something that happens when onPressed the health report (results)
      ),
    );
  }
}