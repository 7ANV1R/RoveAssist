import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:roveassist/app/data/models/auth_user_model.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/data/services/user_auth_services.dart';

import 'package:http/http.dart' as http;
import 'package:roveassist/app/routes/app_pages.dart';

class BecomeAgentController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  final UserAuthServices _userAuthServices = Get.find<UserAuthServices>();
  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';
  @override
  void onInit() {
    fetchUserInfo();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String usernameFromToken = '';
  String emailFromToken = '';
  int userIdFromToken = 0;
  RxList<AuthUserModel> userInfo = RxList<AuthUserModel>();

  GlobalKey<FormState> agentFormKey = GlobalKey<FormState>();

  TextEditingController companyNameTextController = TextEditingController();
  TextEditingController companyDetailsTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController accountsPasswordTextController = TextEditingController();

  String? companyNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Company Name is required';
    }
    return null;
  }

  String? companyDetailsValidator(String? value) {
    if (value!.isEmpty) {
      return 'Company Details is required';
    }
    return null;
  }

  String? companyPhoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Phone Number is required';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please Provide Account\'s Password';
    }
    return null;
  }

  // Future<bool> onTapSubmit(String compName, String compDetails, String compPhone) async {
  //   if (_storageService.authToken != null) {
  //     final String? token = _storageService.authToken;
  //     Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  //     final String id = decodedToken["user_id"].toString();
  //     print(id);

  //     try {
  //       _userAuthServices.onAgentSubmission(compName, compDetails, compPhone, id);
  //       return true;
  //     } catch (e) {
  //       print(e.toString());
  //     }
  //     return false;
  //   }
  //   return false;
  // }

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

      print(data['username']);
      usernameFromToken = data['username'];
      emailFromToken = data['email'];
      userIdFromToken = data['id'];
    }
  }

  Future<bool> onAgentSubmission(
      String compName, String compDetails, String compPhone, String password) async {
    try {
      String baseUrl = '$localhost/accounts/auth/$userIdFromToken/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.put(Uri.parse(baseUrl),
          headers: headers,
          body: json.encode(
            {
              "company_name": compName,
              "phone": compPhone,
              "address": compDetails,
              "password": password,
              "email": emailFromToken,
              "username": usernameFromToken,
            },
          ));

      print(response.body.toString());
      Get.defaultDialog(
          title: 'Submitted!',
          middleText:
              'Thanks for submitting. After a short review, You\'ll be an agent. We\'ll let you know by email.',
          radius: 5,
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.NAV_SERVICE);
              },
              child: Text('Ok'),
            ),
          ]);

      return false;
    } catch (e) {
      print(e.toString());
    }
    return true;
  }
}
