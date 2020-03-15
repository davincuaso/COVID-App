import 'package:covid_test_app/screens/authenticate/authenticate.dart';
import 'package:covid_test_app/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //should show whether or not logged in or not
    return Authenticate();
  }
}