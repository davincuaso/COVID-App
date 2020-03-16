import 'package:flutter/material.dart';
import 'package:covid_test_app/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //states of text fields
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
        title: Text('sign up here'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Sign In'))
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
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please give a valid email';
                        });
                      }
                    }
                  },
                  child: Text('Register'),
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
