import 'package:get/get.dart';

import 'tour_package_dash_controller.dart';

class TourPackageDashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TourPackageDashController>(
      () => TourPackageDashController(),
    );
  }
}
