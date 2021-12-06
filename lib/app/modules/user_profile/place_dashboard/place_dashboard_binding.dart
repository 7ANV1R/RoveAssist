import 'package:get/get.dart';

import 'place_dashboard_controller.dart';

class PlaceDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceDashboardController>(
      () => PlaceDashboardController(),
    );
  }
}
