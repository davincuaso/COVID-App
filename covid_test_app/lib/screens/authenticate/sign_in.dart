import 'package:covid_test_app/services/auth.dart';
import 'package:covid_test_app/shared/loading.dart';
import 'package:covid_test_app/shared/WaveClipper.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:covid_test_app/shared/custom_icons_icons.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class SignInTopPart extends StatefulWidget {
  final Function toggleView;
  SignInTopPart({this.toggleView});

  @override
  _SignInTopPart createState() => _SignInTopPart();
}

class _SignInTopPart extends State<SignInTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(clipper: WaveClipper(),child:Container(height:300.0, color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Login To Your Account',style:
                      TextStyle(color: Color(0xFF022539), fontWeight: FontWeight.bold,fontSize: 16.0))
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                Image.asset('assets/images/auth-img.png', height:112.94, width:160)
              ],
          )
        ),)],
    );
  }
}


var SignInBottomPart = Column(
  children: <Widget>[
    Padding(
        padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50.0),
          Text(
              "Continue with",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)
          )
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            CustomIcons.facebook_official,
            size: 30,
            color: Colors.blue[900],
          ),
          SizedBox(width: 10.0),
          Icon(
            CustomIcons.google,
            size: 30,
            color: Colors.yellow
          ),
          SizedBox(width: 10.0),
          Icon(
            CustomIcons.twitter_squared,
            size: 30,
            color: Colors.lightBlue
          ),
          SizedBox(width: 10.0),
          Icon(
            Icons.phone,
            color: Colors.black,
            size: 30
          )
        ],
      )
    ),
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text('OR',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white)
      ),
    )

  ],
);

class _SignInState extends State<SignIn> {
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
      backgroundColor: Color(0xFF022539),
      resizeToAvoidBottomPadding: false,
      body: Container (
        child: Column(
          children: <Widget>[
            SignInTopPart(),
            SignInBottomPart,
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(width: 5.0,height: 5.0),
                  Container(
                    width: 300.0,
                    height: 45.0,
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 13.0
                      ),
                      validator: (val) =>
                      val.isEmpty ? 'Enter an email please' : null,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(
                              CustomIcons.mail,
                          ),
                          filled: true,
                          fillColor: Color(0xFFECF2FF)
                      ),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    )
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 300.0,
                    height: 45.0,
                    child: TextFormField(
                      style: TextStyle(
                          fontSize: 13.0,
                      ),
                      validator: (val) => val.length < 6
                          ? 'Password must at least contain 6 characters'
                          : null,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(
                            CustomIcons.lock_outline,
                          ),
                          filled: true,
                          fillColor: Color(0xFFECF2FF)
                      ),
//                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    )
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.orange,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Could not sign in through Firebase';
                            loading = false;
                          });
                        }
                      }
                    },
                    child: Text('Sign in', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                  Text('Forgot password?', style: TextStyle(fontSize: 10, color: Colors.white)),
                  Divider(),
                  Padding(
                      padding: EdgeInsets.all(5.0),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Don\'t have an account?', style: TextStyle(fontSize: 12, color: Colors.white)),
                        SizedBox(width: 2.0),
                        FlatButton(
                          onPressed: () {
                            //go to register screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
                          },
                          child: Text('Register here!',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white))
                        ),
                      ],
                    )
                  )
                ],
              )
            )
          ],
        )
      ),
    );
  }
}
