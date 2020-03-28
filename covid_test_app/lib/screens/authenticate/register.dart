import 'package:covid_test_app/screens/authenticate/sign_in.dart';
import 'package:covid_test_app/services/auth.dart';
import 'package:covid_test_app/shared/loading.dart';
import 'package:covid_test_app/shared/WaveClipper.dart';
import 'package:flutter/material.dart';
import 'package:covid_test_app/shared/custom_icons_icons.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class RegisterTopPart extends StatefulWidget {
  final Function toggleView;
  RegisterTopPart({this.toggleView});

  @override
  _RegisterTopPart createState() => _RegisterTopPart();
}

class _RegisterTopPart extends State<RegisterTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(clipper: WaveClipper(),child:Container(height:300.0, color: Color(0xFF022539),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Create Your Account',style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16.0))
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                Image.asset('assets/images/reg-img.png', height:112.94, width:160)
              ],
            )
        ),)],
    );
  }
}

var RegisterBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50.0),
          Text(
              "Register with",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF022539))
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
                color: Colors.blue[900]
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
          style: TextStyle(color: Color(0xFF022539))
      ),
    )

  ],
);

class _RegisterState extends State<Register> {
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container (
        child: Column(
          children: <Widget>[
            RegisterTopPart(),
            RegisterBottomPart,
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
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: 300.0,
                      height: 45.0,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 13.0
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
//                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
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
                          dynamic result = await _auth.registerWithEmailAndPassword(
                              email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Please give a valid email';
                              loading = false;
                            });
                          }
                        }
                      },
                      child: Text('Register',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
//                    Text(error, style: TextStyle(color: Colors.red)),
                    Padding(
                        padding: EdgeInsets.all(0.0),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Already a member?', style: TextStyle(fontSize: 12, color: Color(0xFF022539))),
                            SizedBox(width: 2.0),
                            FlatButton(
                                onPressed: () {
                                  //go to register screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignIn()),
                                  );
                                },
                                child: Text('Login here!',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF022539)))
                            ),
                          ],
                        )
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
