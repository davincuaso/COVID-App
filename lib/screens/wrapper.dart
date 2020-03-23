import 'package:covid_test_app/models/user.dart';
import 'package:covid_test_app/screens/authenticate/authenticate.dart';
import 'package:covid_test_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //accessing user data from the provider
    final user = Provider.of<User>(context);
    
    //should show whether or not logged in or not
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}