import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_test_app/models/form.dart';
import 'package:covid_test_app/screens/home/form_tile.dart';

class HealthReport extends StatefulWidget {
  @override
  _HealthReportState createState() => _HealthReportState();
}

class _HealthReportState extends State<HealthReport> {
  @override
  Widget build(BuildContext context) {

    //query snapshot is a snapshots of firestore collection at that specific time
    final forms = Provider.of<List<FormResult>>(context);
    // forms.forEach((form){
    //   print(form.name);
    //   print(form.healthResult);
    // });
    return ListView.builder(
      itemCount: forms.length,
      itemBuilder: (context, index) {
        return FormTile(form: forms[index]);
      },
    );
  }
}