import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  late Position currentPosition;
  var geoLocator = Geolocator();
  Completer<GoogleMapController> mapController = Completer();

  CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(23.874745, 90.320942),
    zoom: 13,
  );
  @override
  Future<void> onInit() async {
    locatePosition();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    currentPosition = position;
    print(currentPosition);
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = CameraPosition(target: latLngPosition, zoom: 14);
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
