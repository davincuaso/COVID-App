import 'dart:ffi';
import 'package:covid_test_app/screens/authenticate/sign_in.dart';
import 'package:covid_test_app/screens/authenticate/register.dart';
import 'package:covid_test_app/services/auth.dart';
import 'package:covid_test_app/shared/loading.dart';
import 'package:covid_test_app/shared/WaveClipper.dart';
import 'package:flutter/material.dart';


class OnBoard extends StatefulWidget {
  final Function toggleView;
  OnBoard({this.toggleView});

  @override
  _OnBoardState createState() => _OnBoardState();
}

class OnBoardTopPart extends StatefulWidget {
  final Function toggleView;
  OnBoardTopPart({this.toggleView});

  @override
  _OnBoardTopPart createState() => _OnBoardTopPart();
}

class _OnBoardTopPart extends State<OnBoardTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(clipper: WaveClipper(),child:Container(height:580.0, color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(height: 170.0),
                Image.asset('assets/images/auth-img.png', height:182.31, width:271),
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('App Name',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16.0)),
                    ],
                  ),
                ),
                SizedBox(height:5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('App Description',style: TextStyle(color: Colors.grey, fontSize: 13.0))
                  ],
                )
              ],
            )
        ),)],
    );
  }
}

class _OnBoardState extends State<OnBoard> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  //states of text fields
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : new Scaffold(
      backgroundColor: Colors.orange,
      resizeToAvoidBottomPadding: false,
      body: Container (
          child: Column(
            children: <Widget>[
              OnBoardTopPart(),
              SizedBox(height: 20.0),
              Padding(
                  padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          //go to register screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          );
                        },
                        child: Text('Login',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0))
                    ),
                    SizedBox(width: 2.0),
                    Text('|',style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    SizedBox(width: 2.0),
                    FlatButton(
                        onPressed: () {
                          //go to register screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text('Register',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0))
                    ),
                  ],
                )
              )
            ],
          )
      ),
    );
  }
}