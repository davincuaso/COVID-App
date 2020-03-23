import 'package:covid_test_app/models/user.dart';
import 'package:covid_test_app/screens/wrapper.dart';
import 'package:covid_test_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //I am accessing the user data when going to the wrapper through the stream which listens for authentication events depending on user whether it be null or an actual user
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: Wrapper(),
      ),
    );
  }
}
