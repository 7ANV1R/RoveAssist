import 'package:get/get.dart';

import '../../../data/services/storage_service.dart';
import '../../../data/services/user_auth_services.dart';
import '../controllers/nav_service_controller.dart';

class NavServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavServiceController>(
      () => NavServiceController(),
    );
    Get.lazyPut<StorageService>(() => StorageService());
    Get.lazyPut<UserAuthServices>(
      () => UserAuthServices(),
    );
  }
}
