import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roveassist/app/data/services/database_services.dart';

import '../../../data/models/map_style.dart';
import '../../../data/models/type_model/place_model.dart';
import '../../../routes/app_pages.dart';

//import '../../../data/services/storage_service.dart';

class HomeController extends GetxController {
  //final StorageService _storageService = Get.find<StorageService>();

  final DatabaseService _databaseService = Get.find<DatabaseService>();

  @override
  void onInit() {
    recplaceDataList.bindStream(_databaseService.recPlaceFetchStream());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> onTapExploreNearby() async {
    await Geolocator.requestPermission();
    await Get.toNamed(Routes.EXPLORE_NEARBY);
  }

  TextEditingController searchController = TextEditingController();

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapStyleJson.mapStyle);
  }

  final RxList<PlaceDataModel> recplaceDataList = RxList<PlaceDataModel>();

  List<PlaceDataModel> get recplaceData => recplaceDataList;
}
