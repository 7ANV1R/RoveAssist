import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../data/models/auth_user_model.dart';
import '../../data/services/storage_service.dart';
import '../../data/services/user_auth_services.dart';
import '../../routes/app_pages.dart';

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
    Get.offAllNamed(Routes.AUTHENTICATION);
  }

  RxList<AuthUserModel> userInfo = RxList<AuthUserModel>();

  File? imageFile;

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
    }
  }

  Future<void> onTapBecomeAgent() async {
    await Get.toNamed(Routes.BECOME_AGENT);
  }

  Future<void> onTapTravelNote() async {
    await Get.toNamed(Routes.TRAVEL_NOTE);
  }

  Future pickImages() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      imageFile = File(image.path);
    }
  }
}
