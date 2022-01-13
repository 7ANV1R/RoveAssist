import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:roveassist/app/data/models/service_model/place_model.dart';
import 'package:roveassist/app/data/models/service_model/restaurant_model.dart';

import '../../data/models/service_model/package_tour_model.dart';

class SearchResultsController extends GetxController {
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

  TextEditingController queryController = TextEditingController();
  RxList<PackageTourModel> packageTourList = RxList<PackageTourModel>();
  RxList<RestaurantModel> restaurantResultList = RxList<RestaurantModel>();
  RxList<PlaceModel> placeList = RxList<PlaceModel>();

  Future<void> fetchPackageTour(String query) async {
    try {
      String baseUrl = '$localhost/features/packagetour/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<PackageTourModel> fetchedPackageTour = List<PackageTourModel>.from(
        (json.decode(response.body) as List<dynamic>)
            .map(
          (e) => PackageTourModel.fromJson(e as Map<String, dynamic>),
        )
            .where((result) {
          final titleLower = result.title.toLowerCase();

          final searchLower = query.toLowerCase();

          return titleLower.contains(searchLower);
        }),
      ).toList();
      packageTourList.value = fetchedPackageTour.reversed.toList();
      print(packageTourList);
    } catch (e) {}
  }

  Future<void> fetchRestaurant(String query) async {
    try {
      String baseUrl = '$localhost/features/restaurant/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<RestaurantModel> fetchedRestaurant = List<RestaurantModel>.from(
        (json.decode(response.body) as List<dynamic>)
            .map(
          (e) => RestaurantModel.fromJson(e as Map<String, dynamic>),
        )
            .where((result) {
          final titleLower = result.title.toLowerCase();

          final searchLower = query.toLowerCase();

          return titleLower.contains(searchLower);
        }),
      ).toList();
      restaurantResultList.value = fetchedRestaurant.reversed.toList();
      print(restaurantResultList);
    } catch (e) {}
  }

  Future<void> fetchPlace(String query) async {
    try {
      String baseUrl = '$localhost/features/place/';
      Map<String, String> headers = {'Content-Type': 'application/json'};
      http.Response response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      final List<PlaceModel> fetchedPlace = List<PlaceModel>.from(
        (json.decode(response.body) as List<dynamic>)
            .map(
          (e) => PlaceModel.fromJson(e as Map<String, dynamic>),
        )
            .where((result) {
          final titleLower = result.title.toLowerCase();

          final searchLower = query.toLowerCase();

          return titleLower.contains(searchLower);
        }),
      ).toList();
      placeList.value = fetchedPlace.reversed.toList();
      print(restaurantResultList);
    } catch (e) {}
  }
}
