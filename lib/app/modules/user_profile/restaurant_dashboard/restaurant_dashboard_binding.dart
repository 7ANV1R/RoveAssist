import 'package:get/get.dart';

import 'restaurant_dashboard_controller.dart';

class RestaurantDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantDashboardController>(
      () => RestaurantDashboardController(),
    );
  }
}
