import 'package:get/get.dart';
import 'package:roveassist/app/data/models/type_model/place_model.dart';
import 'package:roveassist/app/data/services/database_services.dart';

class SavedController extends GetxController {
  final DatabaseService _databaseService = Get.find<DatabaseService>();
  @override
  void onInit() {
    savedplaceDataList.bindStream(_databaseService.savedplaceFetchStream());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  final RxList<PlaceDataModel> savedplaceDataList = RxList<PlaceDataModel>();

  List<PlaceDataModel> get savedplaceData => savedplaceDataList;
}
