import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roveassist/app/routes/app_pages.dart';

class SignUpPageController extends GetxController {
  final GetConnect connect = GetConnect();
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

  Future<bool> onTapSignUp(String username, String email, String password) async {
    // try {
    //   final url = 'http://localhost:8000/accounts/auth/';
    //   final body = json.encode({"password": "$password", "email": "$email", "username": "$username"});
    //   final headers = {"Accept": "application/json"};

    //   await connect.post(
    //     url,
    //     body,
    //     contentType: 'raw',
    //     headers: headers,
    //   );
    //   print('done');
    //   return false;
    // } catch (e) {
    //   print(e.toString());
    // }
    // return true;

    try {
      String baseUrl = 'http://172.17.2.89:8000/accounts/auth/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.post(Uri.parse(baseUrl),
          headers: headers,
          body: json.encode(
            {"password": password, "email": email, "username": username},
          ));
      var data = json.decode(response.body) as Map;
      print(data);
      print('user created');
      return false;
    } catch (e) {
      print(e.toString());
    }
    return true;

    // try {
    //   String baseUrl = 'http://172.17.2.89:8000/accounts/auth/';
    //   final request = http.Request('POST', Uri.parse('$baseUrl'));
    //   final headers = {
    //     'Content-Type': 'application/json',
    //   };
    //   request.bodyFields = {"password": password, "email": email, "username": username};
    //   request.headers.addAll(headers);
    //   print(request.toString());

    //   print('user created');
    //   return false;
    // } catch (e) {
    //   print(e.toString());
    // }
    // return true;
  }

  Future<void> onTapLogIn() async {
    await Get.toNamed(Routes.LOGIN_PAGE);
  }
}
