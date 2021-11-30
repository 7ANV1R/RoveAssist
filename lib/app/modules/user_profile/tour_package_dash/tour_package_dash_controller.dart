import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:roveassist/app/data/models/service_model/package_tour_model.dart';
import 'package:roveassist/app/modules/home_page/home_page_controller.dart';

import '../../../data/services/storage_service.dart';
import '../../../data/services/user_auth_services.dart';
import 'widgets/add_tour_package.dart';

class TourPackageDashController extends GetxController {
  final HomePageController homePageController = Get.put(HomePageController());
  final UserAuthServices _userAuthServices = Get.find<UserAuthServices>();
  final StorageService _storageService = Get.find<StorageService>();
  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';

  @override
  Future<void> onInit() async {
    await fetchMyPackageTour();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> onTapAddTourPackage() async {
    await Get.to(() => AddTourPackage());
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
      fetchMyPackageTour();
    } catch (e) {
      print(e.toString());
    }
  }

  RxList<PackageTourModel> mypackageTourList = RxList<PackageTourModel>();

  Future<void> fetchMyPackageTour() async {
    try {
      var agentID = await _userAuthServices.getHostId();
      print('agent id ${agentID.toString()}');
      String baseUrl = '$localhost/features/packagetour/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<PackageTourModel> fetchedPackageTour = List<PackageTourModel>.from(
        (json.decode(response.body) as List<dynamic>).where((element) => element['host'] == agentID).map(
              (e) => PackageTourModel.fromJson(e as Map<String, dynamic>),
            ),
      ).toList();
      mypackageTourList.value = fetchedPackageTour.reversed.toList();
      print(mypackageTourList);
    } catch (e) {}
  }
}
