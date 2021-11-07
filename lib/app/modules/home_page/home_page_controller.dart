import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final selectedIndex = 0.obs;
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

  List<String> categoryList = ['Tour Package', 'Restaurant', 'Place', 'Hotel'];

  List<IconData> iconData = [Icons.tour, Icons.restaurant_menu, Icons.place, Icons.room_service];
}
