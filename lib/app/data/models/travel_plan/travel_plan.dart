import 'package:cloud_firestore/cloud_firestore.dart';

class TravelPlanModel {
  String? planId;
  String? content;
  String? title;
  Timestamp? timeCreated;

  TravelPlanModel(
      {required this.planId, required this.content, required this.timeCreated, required this.title});

  TravelPlanModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    planId = documentSnapshot.id;
    content = documentSnapshot["content"];
    timeCreated = documentSnapshot["timeCreated"];
    title = documentSnapshot["title"];
  }
}
