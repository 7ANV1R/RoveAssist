import 'package:get/get.dart';

import 'hotel_dashboard_controller.dart';

class HotelDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelDashboardController>(
      () => HotelDashboardController(),
    );
  }
}
