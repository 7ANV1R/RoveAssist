import 'package:get/get.dart';

import '../controllers/hotel_controller.dart';

class HotelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelController>(
      () => HotelController(),
    );
  }
}
