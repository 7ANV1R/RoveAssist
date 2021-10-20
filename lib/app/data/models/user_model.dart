import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? photoURL;
  String? email;

  UserModel({this.name, this.photoURL, this.email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    name = documentSnapshot["name"];
    email = documentSnapshot["photoURL"];
    email = documentSnapshot["email"];
  }
}
