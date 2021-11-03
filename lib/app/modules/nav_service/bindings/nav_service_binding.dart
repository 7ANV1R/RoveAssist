import 'package:get/get.dart';
import 'package:roveassist/app/data/services/storage_service.dart';

import '../controllers/nav_service_controller.dart';

class NavServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavServiceController>(
      () => NavServiceController(),
    );
    Get.lazyPut<StorageService>(() => StorageService());
  }
}
