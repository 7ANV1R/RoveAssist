import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
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

  //For showing place:
  final RxBool _showingPlace = RxBool(true);
  bool get showingPlace => _showingPlace.value;

  //For showing restaurant:
  final RxBool _showingRestaurant = RxBool(false);
  bool get showingRestaurant => _showingRestaurant.value;

  //For showing hotel:
  final RxBool _showingHotel = RxBool(false);
  bool get showingHotel => _showingHotel.value;

  void onTapPlace() {
    _showingPlace.value = true;
    _showingRestaurant.value = false;
    _showingHotel.value = false;
  }

  void onTapRestaurant() {
    _showingPlace.value = false;
    _showingRestaurant.value = true;
    _showingHotel.value = false;
  }

  void onTapHotel() {
    _showingPlace.value = false;
    _showingRestaurant.value = false;
    _showingHotel.value = true;
  }

  TextEditingController searchController = TextEditingController();
}
