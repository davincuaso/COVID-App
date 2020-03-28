import 'package:covid_test_app/models/form.dart';
import 'package:flutter/material.dart';

class FormTile extends StatelessWidget {

  final FormResult form;
  FormTile( {this.form} );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue,
          ),
          title: Text(form.name),
          subtitle: Text('You are ${form.healthResult} at risk'),
        ),
      ),
    );
  }
}