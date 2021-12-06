import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

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
  final RxBool _isLoading = RxBool(false);
  bool get isLoading => _isLoading.value;

  File? imageFile;

  Future<void> fetchUserInfo() async {
    try {
      _isLoading.value = true;
      var id = await _userAuthServices.getIdFromTokenString();
      String baseUrl = '$localhost/accounts/auth/$id/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      //var data = json.decode(response.body) as Map;
      final AuthUserModel authUserModel = AuthUserModel.fromJson(data);
      // userInfo.value = [authUserModel];
      userInfo.assignAll([authUserModel]);
      _isLoading.value = false;
      print(data['username']);
      print('name from local data ${userInfo.first.username}');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> onTapBecomeAgent() async {
    await Get.toNamed(Routes.BECOME_AGENT);
  }

  Future<void> onTapTourPackage() async {
    await Get.toNamed(Routes.TOUR_PACKAGE_DASH);
  }

  Future<void> onTapAddHotel() async {
    await Get.toNamed(Routes.HOTEL_DASHBOARD);
  }

  Future<void> onTapAddPlace() async {
    await Get.toNamed(Routes.PLACE_DASHBOARD);
  }

  Future<void> onTapAddRestaurant() async {
    await Get.toNamed(Routes.RESTAURANT_DASHBOARD);
  }

  Future<void> onTapTravelNote() async {
    await Get.toNamed(Routes.TRAVEL_NOTE);
  }

  File? selectedImage;
  Future pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      await uploadImage();
    }
  }

  Future uploadImage() async {
    try {
      var id = await _userAuthServices.getIdFromTokenString();

      String baseUrl = '$localhost/accounts/auth/$id/';
      final request = http.MultipartRequest("PATCH", Uri.parse(baseUrl));

      final headers = {"content-type": "multipart/form-data"};

      request.files.add(http.MultipartFile(
          'profile_image', selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
          filename: selectedImage!.path.split("/").last));

      request.headers.addAll(headers);
      request.send();
      print('sucsess');
      fetchUserInfo();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> onRefresh() async {
    print('refresh working');

    Get.delete<UserProfileController>();
    Get.put(UserProfileController());
  }
}
