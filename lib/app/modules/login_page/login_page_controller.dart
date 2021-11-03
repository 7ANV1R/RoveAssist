import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/services/storage_service.dart';
import '../../routes/app_pages.dart';

class LoginPageController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();
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

  Future<bool> onTapLogIn(String email, String password) async {
    try {
      String baseUrl = 'http://172.17.2.89:8000/accounts/token/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.post(Uri.parse(baseUrl),
          headers: headers,
          body: json.encode(
            {"email": email, "password": password},
          ));

      var data = json.decode(response.body) as Map;
      print(data);
      if (data.containsKey('refresh')) {
        _storageService.authToken = data['refresh'];
        print(data['refresh']);
        Get.offAllNamed(Routes.USER_PROFILE);
      } else {
        print('error in login');
      }
      print('user created');
      return false;
    } catch (e) {}
    return true;
  }
}
