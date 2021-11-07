import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/services/user_auth_services.dart';
import '../../routes/app_pages.dart';

class SignUpPageController extends GetxController {
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

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  Future<void> onTapSignUp(String username, String email, String password) async {
    _userAuthServices.onSignUp(username, email, password);
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide Proper email";
    }
    return null;
  }

  bool checkValid() {
    final isValid = signUpFormKey.currentState!.validate();
    if (!isValid) {
      return true;
    } else {
      signUpFormKey.currentState!.save();
      return false;
    }
  }

  Future<void> onTapLogIn() async {
    await Get.toNamed(Routes.LOGIN_PAGE);
  }
}
