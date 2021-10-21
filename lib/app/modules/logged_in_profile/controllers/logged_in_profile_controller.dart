import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roveassist/app/data/models/travel_plan/travel_plan.dart';
import 'package:roveassist/app/data/services/database_services.dart';
import 'package:roveassist/app/modules/logged_in_profile/widgets/add_travel_plan.dart';

import '../../../data/services/auth_service.dart';

class LoggedInProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final DatabaseService _databaseService = Get.find<DatabaseService>();
  final user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    travelPlanList.bindStream(_databaseService.travelPlanStream(_authService.user?.email ?? user!.email));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future onTapLogOut() async {
    Get.delete<LoggedInProfileController>();
    super.dispose();

    _authService.onTapLogOut();
  }

  TextEditingController travelPlanTextController = TextEditingController();
  TextEditingController travelPlanTitleController = TextEditingController();

  Future<void> onTapAddTravelPlan(String? title, String content) async {
    _databaseService.addPlan(title, content, _authService.user?.email ?? user!.email);
  }

  final RxList<TravelPlanModel> travelPlanList = RxList<TravelPlanModel>();

  List<TravelPlanModel> get travelPlans => travelPlanList;

  Future<void> onTapAddNavigation() async {
    Get.to(() => AddTravelPlan());
  }

  String formattedDateTime(Timestamp timestamp) {
    var dateTimeFromStamp = DateTime.fromMillisecondsSinceEpoch(timestamp.seconds * 1000);
    return DateFormat('hh:mm a').format(dateTimeFromStamp);
    // return DateFormat('hh:mm a dd MMMM, yyyy').format(dateTimeFromStamp);
  }
}
