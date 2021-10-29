import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceDataModel {
  String? placeId;
  String? details;
  String? name;
  String? photoUrl;
  bool? isSaved;
  bool? isRec;

  PlaceDataModel(
      {required this.placeId,
      required this.details,
      required this.name,
      required this.photoUrl,
      required this.isSaved,
      required this.isRec});

  PlaceDataModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    placeId = documentSnapshot.id;
    details = documentSnapshot["details"];
    photoUrl = documentSnapshot["photoUrl"];
    name = documentSnapshot["name"];
    isSaved = documentSnapshot["isSaved"];
    isRec = documentSnapshot["isRec"];
  }
}
