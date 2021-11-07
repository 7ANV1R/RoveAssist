import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:roveassist/app/data/models/auth_user_model.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/routes/app_pages.dart';

import '../../data/services/user_auth_services.dart';

import 'package:http/http.dart' as http;

class AuthViewController extends GetxController {
  final UserAuthServices _userAuthServices = Get.find<UserAuthServices>();

  final StorageService _storageService = Get.find<StorageService>();

  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';

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

  //For login page:
  final RxBool _loginPage = RxBool(true);
  bool get loginPage => _loginPage.value;

  //For signup page :
  final RxBool _signupPage = RxBool(false);
  bool get signupPage => _signupPage.value;

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  final RxBool _isBosecure = RxBool(true);
  bool get isObsecure => _isBosecure.value;
  set isObsecure(bool value) => _isBosecure.value = value;

  Future<void> onTapNewMember() async {
    _loginPage.value = false;
    _signupPage.value = true;
  }

  Future<void> onTapLogIn(String email, String password) async {
    _userAuthServices.onLogIn(email, password);
    Get.replace(Routes.USER_PROFILE);
    Get.toNamed(Routes.USER_PROFILE);
  }

  //Signup
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController usernameTextController = TextEditingController();

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

  Future<void> onTapAlreadyMember() async {
    _loginPage.value = true;
    _signupPage.value = false;
  }

  //for profile

  Future<void> onTapLogOut() async {
    _userAuthServices.onLogOut();

    _loginPage.value = true;

    _signupPage.value = false;
  }

  RxList<AuthUserModel> userInfo = RxList<AuthUserModel>();

  Future<void> fetchUserInfo() async {
    if (_storageService.authToken != null) {
      final String? token = _storageService.authToken;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      final String id = decodedToken["user_id"].toString();
      print(id);

      String baseUrl = '$localhost/accounts/auth/$id/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      //var data = json.decode(response.body) as Map;
      final AuthUserModel authUserModel = AuthUserModel.fromJson(data);
      userInfo.value = [authUserModel];

      print(data);
    }
  }
}
