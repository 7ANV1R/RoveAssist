import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../widgets/snakbar/general_snakbar.dart';

class ExploreNearbyController extends GetxController {
  RxBool isBusy = RxBool(false);

  @override
  Future<void> onInit() async {
    isBusy.value = true;

    final LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      final Position myLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      initialCameraPosition = CameraPosition(
        target: LatLng(myLocation.latitude, myLocation.longitude),
        zoom: 16.0,
      );
    } else {
      showGeneralSnakbar(
        message: 'Please give location permission to use this feature.',
        backgroundColor: Colors.red,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
      );
    }

    isBusy.value = false;
    super.onInit();
  }

  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition initialCameraPosition;

  @override
  void onClose() {
    mapController.future.then((value) => value.dispose());

    super.onClose();
  }
}
