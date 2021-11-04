import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roveassist/app/data/services/user_auth_services.dart';
import 'package:roveassist/app/routes/app_pages.dart';

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

  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  Future<void> onTapSignUp(String username, String email, String password) async {
    _userAuthServices.onSignUp(username, email, password);
    _userAuthServices.onLogIn(email, password);
  }

  Future<void> onTapLogIn() async {
    await Get.toNamed(Routes.LOGIN_PAGE);
  }
}
