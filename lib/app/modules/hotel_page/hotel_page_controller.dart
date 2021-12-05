import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HotelPageController extends GetxController {
  @override
  void onInit() {
    checkInDateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
      )),
    );
    checkOutDateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 2,
      )),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late TextEditingController checkInDateController;
  late TextEditingController checkOutDateController;
  TextEditingController destinationTextController =
      TextEditingController(text: 'Dhaka');
  TextEditingController adultsCountTextController =
      TextEditingController(text: '1');
  TextEditingController childrenCountTextController =
      TextEditingController(text: '0');

  void formatAndSetCheckInDate(DateTime dateTime) {
    checkInDateController.text = DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void formatAndSetCheckOutDate(DateTime dateTime) {
    checkOutDateController.text = DateFormat('yyyy-MM-dd').format(dateTime);
  }

  Future<void> onTapSearchHotel() async {}
}
