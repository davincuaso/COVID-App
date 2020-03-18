import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {

  final String uid;
  DataBaseService({this.uid});

  //collection reference in firebase
  final CollectionReference formCollection = Firestore.instance.collection('forms');

  Future updateUserData(String name, String healthResult) async {
    //firebase creates the user uid if one doesnt exist
    return await formCollection.document(uid).setData({
      'name' : name,
      'healthResult' : healthResult,
    });
  }

}