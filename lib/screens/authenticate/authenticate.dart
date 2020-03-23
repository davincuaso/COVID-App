import 'package:covid_test_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:covid_test_app/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
        return SignIn(toggleView: toggleView);
        // child: Register(),
      } else {
        return Register(toggleView: toggleView);
      }
    }
  }

