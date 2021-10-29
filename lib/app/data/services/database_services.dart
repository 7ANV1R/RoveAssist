import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/travel_plan/travel_plan.dart';
import '../models/type_model/place_model.dart';
import '../models/user_model.dart';

class DatabaseService extends GetxService {
  Future<DatabaseService> init() async {
    return this;
  }

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await firebaseFirestore.collection("users").doc(user.email).set({
        "name": user.name,
        "email": user.email,
        "photoURL": user.photoURL,
      });
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<UserModel> getUser(String email) async {
    try {
      DocumentSnapshot doc = await firebaseFirestore.collection("users").doc(email).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> addPlan(String? title, String content, String? email) async {
    try {
      await firebaseFirestore.collection("users").doc(email).collection("travelPlan").add({
        "timeCreated": Timestamp.now(),
        "content": content,
        "title": title,
      });
    } catch (e) {}
  }

  Future<void> updatePlan(String? newtitle, String newcontent, String? email, String? planID) async {
    try {
      await firebaseFirestore.collection("users").doc(email).collection("travelPlan").doc(planID).update({
        "timeCreated": Timestamp.now(),
        "content": newcontent,
        "title": newtitle,
      });
    } catch (e) {}
  }

  Future<void> deletePlan(String? email, String? planID) async {
    try {
      await firebaseFirestore.collection("users").doc(email).collection("travelPlan").doc(planID).delete();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }

  Stream<List<TravelPlanModel>> travelPlanStream(String? email) {
    return firebaseFirestore
        .collection("users")
        .doc(email)
        .collection("travelPlan")
        .orderBy("timeCreated", descending: true)
        .snapshots()
        .map((event) {
      List<TravelPlanModel> returnValue = [];
      event.docs.forEach((element) {
        returnValue.add(TravelPlanModel.fromDocumentSnapshot(element));
      });
      return returnValue;
    });
  }

  Stream<List<PlaceDataModel>> placeFetchStream() {
    return firebaseFirestore.collection("places").orderBy("name", descending: true).snapshots().map((event) {
      List<PlaceDataModel> returnValue = [];
      event.docs.forEach((element) {
        returnValue.add(PlaceDataModel.fromDocumentSnapshot(element));
      });
      return returnValue;
    });
  }

  Stream<List<PlaceDataModel>> savedplaceFetchStream() {
    return firebaseFirestore.collection("places").where("isSaved", isEqualTo: true).snapshots().map((event) {
      List<PlaceDataModel> returnValue = [];
      event.docs.forEach((element) {
        returnValue.add(PlaceDataModel.fromDocumentSnapshot(element));
      });
      return returnValue;
    });
  }

  Stream<List<PlaceDataModel>> recPlaceFetchStream() {
    return firebaseFirestore.collection("places").where("isRec", isEqualTo: true).snapshots().map((event) {
      List<PlaceDataModel> returnValue = [];
      event.docs.forEach((element) {
        returnValue.add(PlaceDataModel.fromDocumentSnapshot(element));
      });
      return returnValue;
    });
  }

  Future<void> addSavedPlace(String? placeID) async {
    try {
      await firebaseFirestore.collection("places").doc(placeID).update({
        "isSaved": true,
      });
    } catch (e) {}
  }

  Future<void> removeSavedPlace(String? placeID) async {
    try {
      await firebaseFirestore.collection("places").doc(placeID).update({
        "isSaved": false,
      });
    } catch (e) {}
  }
}
