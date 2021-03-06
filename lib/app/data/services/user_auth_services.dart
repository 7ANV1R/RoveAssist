import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../routes/app_pages.dart';
import '../../widgets/snakbar/general_snakbar.dart';
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
        print('storage token' + data['access']);

        showGeneralSnakbar(
          message: 'Logged in successfully',
          backgroundColor: Colors.green,
          icon: Icon(
            Icons.login,
            color: Colors.white,
          ),
        );
        Get.offAllNamed(Routes.NAV_SERVICE);
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

          Get.offAllNamed(Routes.NAV_SERVICE);
          showGeneralSnakbar(
            message: 'Welcome to RoveAssist',
            backgroundColor: Colors.green,
            icon: Icon(
              Icons.login,
              color: Colors.white,
            ),
          );
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

  Future<String> getIdFromTokenString() async {
    if (_storageService.authToken != null) {
      final String? token = _storageService.authToken;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      final String id = decodedToken["user_id"].toString();
      return id;
    }
    return 'not found';
  }

  Future<int> getIdFromTokenInt() async {
    if (_storageService.authToken != null) {
      final String? token = _storageService.authToken;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
      final int id = decodedToken["user_id"];
      return id;
    }
    return 0;
  }

  Future<void> onLogOut() async {
    _storageService.authToken = null;
  }

  int agentid = 0;

  Future<int> getHostId() async {
    try {
      var tokenId = await getIdFromTokenInt();
      print(tokenId.toString());

      String baseUrl = '$localhost/agent/agentlist/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final fetchedNotes =
          (json.decode(response.body) as List<dynamic>).where((element) => element['agent'] == tokenId);
      print('host id ${fetchedNotes.first["id"]}');

      return fetchedNotes.first["id"];
    } catch (e) {
      return 0;
    }
  }

  // File? selectedImage;
  // Uint8List? regularImage;
  // Future pickImages() async {
  //   final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedImage == null) {
  //     return;
  //   } else {
  //     selectedImage = File(pickedImage.path);
  //     regularImage = await selectedImage!.readAsBytes();
  //     final imageFile = MultipartFile(regularImage, filename: 'profile.png', contentType: 'image');
  //     print(pickedImage.path);
  //     print(pickedImage.path.toString());
  //     print(selectedImage.toString());
  //     print(imageFile.toString());
  //     try {
  //       String baseUrl = '$localhost/accounts/auth/';
  //       Map<String, String> headers = {'Content-Type': 'application/json'};
  //       http.Response response = await http.patch(Uri.parse(baseUrl),
  //           headers: headers,
  //           body: json.encode(
  //             {"profile_image": "$localhost/media/user/dp/$imageFile"},
  //           ));
  //     } catch (e) {}
  //   }
  // }
}
