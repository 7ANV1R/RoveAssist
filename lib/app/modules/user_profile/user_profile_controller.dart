import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:roveassist/app/data/models/auth_user_model.dart';
import 'package:roveassist/app/data/services/storage_service.dart';

import '../../data/services/user_auth_services.dart';

import 'package:http/http.dart' as http;

class UserProfileController extends GetxController {
  final UserAuthServices _userAuthServices = Get.find<UserAuthServices>();
  final StorageService _storageService = Get.find<StorageService>();
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

  @override
  void onClose() {}

  Future<void> onTapLogOut() async {
    _userAuthServices.onLogOut();
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
