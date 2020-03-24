
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_test_app/models/form.dart';

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

  //gets a form list from the snapshot
  List<FormResult> _formListFromSnapshot(QuerySnapshot snapshot) {
    //how to get the documents within the snapshot
    //the map function maps the documents into another iterable
    //returning a new iterable of several forms dependent on what we have in the collection
    return snapshot.documents.map((doc){
      return FormResult(name: doc.data['name'] ?? '', healthResult: doc.data['healthResult'] ?? '');
    }).toList(); //this is to change it from an iterable to a list
  }

  //get the form stream of the firestore collection
  Stream<List<FormResult>> get forms {
    //this is a method using the firestore library
    return formCollection.snapshots().map(_formListFromSnapshot);
  }

}