import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roveassist/app/data/models/user_model.dart';
import 'package:roveassist/app/data/services/database_services.dart';

import '../../../data/services/auth_service.dart';

class LoggedInProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();
  final DatabaseService _databaseService = Get.find<DatabaseService>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future onTapLogOut() async {
    _authService.onTapLogOut();
  }

  Rx<UserModel> _userModel = UserModel().obs;
  UserModel get userModel => _userModel.value;
  set userModel(UserModel value) => this._userModel.value = value;

  void userClear() {
    _userModel.value = UserModel();
  }

  TextEditingController addController = TextEditingController();

  Future<void> onTapAddTravelPlan(String content) async {
    _databaseService.addPlan(content, _authService.user.id);
  }
}
