import 'package:covid_test_app/services/auth.dart';
import 'package:covid_test_app/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

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
      resizeToAvoidBottomPadding: false,
      // body: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: <Widget>[
      //       Container(
      //         child: Stack(
      //           children: <Widget>[
      //             Container(
      //               padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
      //               child: Text('Login',
      //                   style: TextStyle(
      //                       fontSize: 80.0, fontWeight: FontWeight.bold)),
      //             ),
      //             Container(
      //               padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
      //               child: Text('Here',
      //                   style: TextStyle(
      //                       fontSize: 80.0, fontWeight: FontWeight.bold)),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //     child: Form(
      //       child: Column(
      //         children: <Widget>[],
      //       ),
      //     )),
      appBar: AppBar(
        title: Text('sign in here'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) =>
                      val.isEmpty ? 'Enter an email please' : null,
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.length < 6
                      ? 'Password must at least contain 6 characters'
                      : null,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
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
                  child: Text('Sign in'),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(error, style: TextStyle(color: Colors.red)),
              ],
            )),
      ),
    );
  }
}
