import 'package:get/get.dart';

//import '../../../data/services/storage_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  //final StorageService _storageService = Get.find<StorageService>();

  final count = 0.obs;
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
  void increment() => count.value++;
}
