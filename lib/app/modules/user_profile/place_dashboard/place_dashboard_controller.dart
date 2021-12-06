import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../data/models/service_model/place_model.dart';
import '../../../data/services/storage_service.dart';
import '../../../data/services/user_auth_services.dart';
import '../../home_page/home_page_controller.dart';
import 'widgets/add_place.dart';

class PlaceDashboardController extends GetxController {
  final HomePageController homePageController = Get.put(HomePageController());
  final UserAuthServices _userAuthServices = Get.find<UserAuthServices>();
  final StorageService _storageService = Get.find<StorageService>();
  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';

  @override
  Future<void> onInit() async {
    await fetchPlace();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> onTapAddPlace() async {
    await Get.to(() => AddPlace());
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

  Future postPlace(String title, String description) async {
    try {
      var userID = await _userAuthServices.getIdFromTokenInt();
      print('agent id ${userID.toString()}');

      String baseUrl = '$localhost/features/place/';
      final request = http.MultipartRequest("POST", Uri.parse(baseUrl));

      final headers = {"Content-Type": "application/x-www-form-urlencoded"};

      // request.fields.assignAll({
      //   "title": title,
      //   "description": description,
      //   "host": id,
      // });

      request.fields['title'] = title;

      request.fields['description'] = description;
      request.fields['user'] = userID.toString();

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
      fetchPlace();
    } catch (e) {
      print(e.toString());
    }
  }

  RxList<PlaceModel> myPlaceList = RxList<PlaceModel>();

  Future<void> fetchPlace() async {
    try {
      var userID = await _userAuthServices.getIdFromTokenInt();
      print('userID ${userID.toString()}');
      String baseUrl = '$localhost/features/place/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<PlaceModel> fetchedPlace = List<PlaceModel>.from(
        (json.decode(response.body) as List<dynamic>).where((element) => element['user'] == userID).map(
              (e) => PlaceModel.fromJson(e as Map<String, dynamic>),
            ),
      ).toList();
      myPlaceList.value = fetchedPlace.reversed.toList();
      print(myPlaceList);
    } catch (e) {}
  }
}
