import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/models/service_model/package_tour_model.dart';

class HomePageController extends GetxController {
  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';
  final selectedIndex = 0.obs;
  @override
  void onInit() {
    fetchPackageTour();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  List<String> categoryList = ['Tour Package', 'Restaurant', 'Place', 'Hotel'];

  List<IconData> iconData = [Icons.tour, Icons.restaurant_menu, Icons.place, Icons.room_service];

  RxList<PackageTourModel> packageTourList = RxList<PackageTourModel>();

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
}
