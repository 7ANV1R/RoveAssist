import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:roveassist/app/data/models/service_model/restaurant_model.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/data/services/user_auth_services.dart';
import 'package:roveassist/app/modules/home_page/home_page_controller.dart';

class RestaurantDashboardController extends GetxController {
  final HomePageController homePageController = Get.put(HomePageController());
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

  Future<void> onTapAddPlace() async {
    // await Get.to(() => AddPlace());
  }

  File? selectedImage;
  Future pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      // await uploadImage();
    }
  }

  // Future uploadImage(File file) async {
  //   try {
  //     final form = FormData({
  //       'cover_image': MultipartFile(file, filename: 'packagetour.jpg'),
  //     });
  //     final response =
  //         await http.patch(Uri.parse("http://169.254.220.94:8000/media/company/post_image/$form"));
  //   } catch (e) {}
  // }

  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();

  Future postPackageTour(String title, String description) async {
    try {
      var agentID = await _userAuthServices.getHostId();
      print('agent id ${agentID.toString()}');

      String baseUrl = '$localhost/features/packagetour/';
      final request = http.MultipartRequest("POST", Uri.parse(baseUrl));

      final headers = {"Content-Type": "application/x-www-form-urlencoded"};

      // request.fields.assignAll({
      //   "title": title,
      //   "description": description,
      //   "host": id,
      // });

      request.fields['title'] = title;

      request.fields['description'] = description;
      request.fields['host'] = agentID.toString();

      if (selectedImage != null) {
        request.files.add(http.MultipartFile(
            'cover_image', selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
            filename: selectedImage!.path.split("/").last));
      }

      request.headers.addAll(headers);
      // request.finalize();
      // request.send();
      var response = await request.send();
      print(response.statusCode);

      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
      print('sucsess');
      Get.back();
      homePageController.fetchPackageTour();
      fetchMyRestaurant();
    } catch (e) {
      print(e.toString());
    }
  }

  RxList<RestaurantModel> myRestaurantList = RxList<RestaurantModel>();

  Future<void> fetchMyRestaurant() async {
    try {
      var agentID = await _userAuthServices.getHostId();
      print('agent id ${agentID.toString()}');
      String baseUrl = '$localhost/features/packagetour/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<RestaurantModel> fetchedPackageTour = List<RestaurantModel>.from(
        (json.decode(response.body) as List<dynamic>).where((element) => element['host'] == agentID).map(
              (e) => RestaurantModel.fromJson(e as Map<String, dynamic>),
            ),
      ).toList();
      myRestaurantList.value = fetchedPackageTour.reversed.toList();
      print(myRestaurantList);
    } catch (e) {}
  }
}
