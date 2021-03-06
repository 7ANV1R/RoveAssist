import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roveassist/app/core/values/assets.dart';
import 'package:roveassist/app/routes/app_pages.dart';

import '../../data/models/service_model/hotel_model.dart';
import '../../data/models/service_model/package_tour_model.dart';
import '../../data/models/service_model/place_model.dart';
import '../../data/models/service_model/restaurant_model.dart';

class HomePageController extends GetxController {
  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';
  final selectedIndex = 0.obs;
  @override
  void onInit() {
    fetchPackageTour();
    fetchRestaurant();
    fetchPlace();
    fetchHotelResult();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  TextEditingController searchController = TextEditingController();

  List<String> categoryList = ['Tour Package', 'Restaurant', 'Place', 'Hotel'];

  List<IconData> iconData = [Icons.tour, Icons.restaurant_menu, Icons.place, Icons.room_service];
  List<String> bgData = [kAssetTabTour, kAssetTabRestaurant, kAssetPlaceBg, kAssetHotelBg];

  RxList<PackageTourModel> packageTourList = RxList<PackageTourModel>();
  RxList<PackageTourModel> packageTourListResults = RxList<PackageTourModel>();
  RxList<RestaurantModel> restaurantList = RxList<RestaurantModel>();
  RxList<PlaceModel> placeList = RxList<PlaceModel>();
  RxList<HotelModel> hotelResultList = RxList<HotelModel>();

  Future<void> fetchHotelResult() async {
    try {
      String baseUrl = '$localhost/agent/hotellist/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<HotelModel> fetchedHotelSearch = List<HotelModel>.from(
        (json.decode(response.body) as List<dynamic>).map(
          (e) => HotelModel.fromJson(e as Map<String, dynamic>),
        ),
      ).toList();
      hotelResultList.value = fetchedHotelSearch.reversed.toList();
      print(hotelResultList);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fetchPackageTour() async {
    try {
      String baseUrl = '$localhost/features/packagetour/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<PackageTourModel> fetchedPackageTour = List<PackageTourModel>.from(
        (json.decode(response.body) as List<dynamic>).map(
          (e) => PackageTourModel.fromJson(e as Map<String, dynamic>),
        ),
      ).toList();
      packageTourList.value = fetchedPackageTour.reversed.toList();
    } catch (e) {}
  }

  Future<void> fetchRestaurant() async {
    try {
      String baseUrl = '$localhost/features/restaurant/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<RestaurantModel> fetchedRestaurant = List<RestaurantModel>.from(
        (json.decode(response.body) as List<dynamic>).map(
          (e) => RestaurantModel.fromJson(e as Map<String, dynamic>),
        ),
      ).toList();
      restaurantList.value = fetchedRestaurant.reversed.toList();
    } catch (e) {}
  }

  Future<void> fetchPlace() async {
    try {
      String baseUrl = '$localhost/features/place/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<PlaceModel> fetchedPlace = List<PlaceModel>.from(
        (json.decode(response.body) as List<dynamic>).map(
          (e) => PlaceModel.fromJson(e as Map<String, dynamic>),
        ),
      ).toList();
      placeList.value = fetchedPlace.reversed.toList();
    } catch (e) {}
  }

  Future<void> onTapSearch() async {
    Get.toNamed(Routes.SEARCH_RESULTS);
  }
}
