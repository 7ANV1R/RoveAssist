import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/data/models/travel_plan/travel_plan.dart';
import 'package:roveassist/app/data/services/database_services.dart';

import '../../../data/services/auth_service.dart';

class LoggedInProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final DatabaseService _databaseService = Get.find<DatabaseService>();

  @override
  void onInit() {
    travelPlanList.bindStream(_databaseService.travelPlanStream(_authService.user.id));
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

  TextEditingController addController = TextEditingController();

  Future<void> onTapAddTravelPlan(String? title, String content) async {
    _databaseService.addPlan(title, content, _authService.user.id);
  }

  final RxList<TravelPlanModel> travelPlanList = RxList<TravelPlanModel>();

  List<TravelPlanModel> get travelPlans => travelPlanList;
}
