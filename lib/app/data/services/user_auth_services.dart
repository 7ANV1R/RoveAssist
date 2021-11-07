import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roveassist/app/widgets/snakbar/general_snakbar.dart';

import '../../routes/app_pages.dart';
import 'storage_service.dart';

class UserAuthServices extends GetxService {
  Future<UserAuthServices> init() async {
    return this;
  }

  final StorageService _storageService = Get.find<StorageService>();

  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';

  Future<bool> onLogIn(String email, String password) async {
    try {
      String baseUrl = '$localhost/accounts/token/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.post(Uri.parse(baseUrl),
          headers: headers,
          body: json.encode(
            {"email": email, "password": password},
          ));

      var data = json.decode(response.body) as Map;
      print(data);
      if (data.containsKey('access')) {
        _storageService.authToken = data['access'];
        print(data['access']);

        showGeneralSnakbar(
          message: 'Logged in successfully',
          backgroundColor: Colors.green,
          icon: Icon(
            Icons.login,
            color: Colors.white,
          ),
        );
      } else {
        showGeneralSnakbar(
          message: 'Email or password did not match',
          backgroundColor: Colors.red,
          icon: Icon(
            Icons.warning,
            color: Colors.white,
          ),
        );
        print('error in login');
      }

      return false;
    } catch (e) {}
    return true;
  }

  Future<bool> onSignUp(String username, String email, String password) async {
    try {
      String baseUrl = '$localhost/accounts/auth/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.post(Uri.parse(baseUrl),
          headers: headers,
          body: json.encode(
            {"password": password, "email": email, "username": username},
          ));
      var data = json.decode(response.body) as Map;
      print(data);
      print('user created');
      try {
        String baseUrl = '$localhost/accounts/token/';
        Map<String, String> headers = {'Content-Type': 'application/json'};
        http.Response response = await http.post(Uri.parse(baseUrl),
            headers: headers,
            body: json.encode(
              {"email": email, "password": password},
            ));

        var data = json.decode(response.body) as Map;
        print(data);
        if (data.containsKey('access')) {
          _storageService.authToken = data['access'];
          print(data['access']);
        } else {
          showGeneralSnakbar(
            message: 'Not formatted correctly',
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.warning,
              color: Colors.white,
            ),
          );
          print('error in signup');
        }
        return false;
      } catch (e) {}
      return false;
    } catch (e) {
      print(e.toString());
    }
    return true;
  }

  Future<void> onLogOut() async {
    _storageService.authToken = null;
  }
}