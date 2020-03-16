import 'package:covid_test_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //creates the user object depending on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change to user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    // .map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }

  //Anonymous sign in
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //function to sign in
  Future signOut() async {
    try{
      return _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}