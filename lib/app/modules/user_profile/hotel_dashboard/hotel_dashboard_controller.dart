import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roveassist/app/data/models/service_model/hotel_model.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/data/services/user_auth_services.dart';
import 'package:roveassist/app/modules/home_page/home_page_controller.dart';

class HotelDashboardController extends GetxController {
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

  RxList<HotelModel> myHotelList = RxList<HotelModel>();

  Future<void> fetchMyHotel() async {
    try {
      var userID = await _userAuthServices.getIdFromTokenInt();
      print('userID ${userID.toString()}');
      var agentID = await _userAuthServices.getHostId();
      print('agent id ${agentID.toString()}');
      String baseUrl = '$localhost/agent/hotellist/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<HotelModel> fetchedHotel = List<HotelModel>.from(
        (json.decode(response.body) as List<dynamic>).where((element) => element['user'] == agentID).map(
              (e) => HotelModel.fromJson(e as Map<String, dynamic>),
            ),
      ).toList();
      myHotelList.value = fetchedHotel.reversed.toList();
      print(myHotelList);
    } catch (e) {}
  }
}
