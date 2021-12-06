import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:roveassist/app/data/models/service_model/hotel_model.dart';

class HotelSearchResultController extends GetxController {
  final String localhost = dotenv.env['BASE_URL'] ?? 'not found';
  @override
  void onInit() {
    fetchHotelResult();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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
}
