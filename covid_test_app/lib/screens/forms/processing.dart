import 'dart:ffi';
import 'package:covid_test_app/shared/loading.dart';
import 'package:flutter/material.dart';


class ProcessScreen extends StatefulWidget {
  final Function toggleView;
  ProcessScreen({this.toggleView});

  @override
  _ProcessState createState() => _ProcessState();
}


class _ProcessState extends State<ProcessScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
              children: <Widget>[
                SizedBox(height:220.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/analyze-img.png', height:195, width:253),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Analyze', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black
                    )),
                    SizedBox(width: 5.0),
                    Text('Your Results', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF6C63FF)
                    ))
                  ],
                )
              ],
            ),
      ),
    );
  }
}