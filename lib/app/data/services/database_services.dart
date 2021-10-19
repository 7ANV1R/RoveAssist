import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/data/models/travel_plan/travel_plan.dart';
import 'package:roveassist/app/data/models/user_model.dart';

class DatabaseService extends GetxService {
  Future<DatabaseService> init() async {
    return this;
  }

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await firebaseFirestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "photoURL": user.photoURL,
      });
      return true;
    } catch (e) {
      return true;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await firebaseFirestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> addPlan(String? title, String content, String uid) async {
    try {
      await firebaseFirestore.collection("users").doc(uid).collection("travelPlan").add({
        "timeCreated": Timestamp.now(),
        "content": content,
        "title": title,
      });
    } catch (e) {}
  }

  Stream<List<TravelPlanModel>> travelPlanStream(String uid) {
    return firebaseFirestore
        .collection("users")
        .doc(uid)
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
}
