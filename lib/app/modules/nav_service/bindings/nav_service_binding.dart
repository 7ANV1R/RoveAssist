import 'package:get/get.dart';

import '../controllers/nav_service_controller.dart';

class NavServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavServiceController>(
      () => NavServiceController(),
    );
  }
}
