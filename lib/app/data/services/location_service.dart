import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../widgets/snakbar/general_snakbar.dart';

class LocationServices extends GetxService {
  Future<LocationServices> init() async {
    return this;
  }

  Future<Position?> getMyPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    if (await Geolocator.isLocationServiceEnabled()) {
      if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
        final Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        return position;
      } else {
        Get.back();
        await showGeneralSnakbar(
          message: 'Opps! Can not get your location',
          backgroundColor: Colors.red,
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
        );
      }
    } else {
      Get.back();
      await showGeneralSnakbar(
        message: 'Please turn on location service',
        backgroundColor: Colors.red,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
      );
    }
  }
}
