import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/type_model/place_model.dart';
import '../../../../data/services/database_services.dart';
import '../../../../widgets/snakbar/general_snakbar.dart';

class PlaceController extends GetxController {
  final DatabaseService _databaseService = Get.find<DatabaseService>();

  void onInit() {
    placeDataList.bindStream(_databaseService.placeFetchStream());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  final RxBool _isSaved = RxBool(false);
  bool get isSaved => _isSaved.value;

  final RxList<PlaceDataModel> placeDataList = RxList<PlaceDataModel>();

  List<PlaceDataModel> get placeData => placeDataList;

  Future<void> onTapAddSaved(String placeId) async {
    _databaseService.addSavedPlace(placeId);
    await showGeneralSnakbar(
      message: 'Added to saved',
      backgroundColor: Colors.green,
      icon: Icon(
        Icons.edit_attributes_rounded,
        color: Colors.white,
      ),
    );
  }

  Future<void> onTapRemoveSaved(String placeId) async {
    _databaseService.removeSavedPlace(placeId);

    await showGeneralSnakbar(
      message: 'Removed from Saved',
      backgroundColor: Colors.red,
      icon: Icon(
        Icons.edit_attributes_rounded,
        color: Colors.white,
      ),
    );
  }
}
