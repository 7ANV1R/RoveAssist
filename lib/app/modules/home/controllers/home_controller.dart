import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roveassist/app/modules/home/views/home_view.dart';

//import '../../../data/services/storage_service.dart';

class HomeController extends GetxController {
  //final StorageService _storageService = Get.find<StorageService>();

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

  TextEditingController searchController = TextEditingController();

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapColorStyle.mapStyle);
  }
}
