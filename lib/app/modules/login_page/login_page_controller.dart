import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/user_auth_services.dart';
import '../../routes/app_pages.dart';

class LoginPageController extends GetxController {
  final UserAuthServices _userAuthServices = Get.find<UserAuthServices>();
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
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  final RxBool _isBosecure = RxBool(true);
  bool get isObsecure => _isBosecure.value;
  set isObsecure(bool value) => _isBosecure.value = value;

  Future<void> onTapSignUp() async {
    await Get.toNamed(Routes.SIGN_UP_PAGE);
  }

  Future<void> onTapLogIn(String email, String password) async {
    _userAuthServices.onLogIn(email, password);
  }
}
