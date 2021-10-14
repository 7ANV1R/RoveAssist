import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? photoURL;
  String? email;

  UserModel({this.id, this.name, this.photoURL, this.email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["photoURL"];
    email = documentSnapshot["email"];
  }
}
