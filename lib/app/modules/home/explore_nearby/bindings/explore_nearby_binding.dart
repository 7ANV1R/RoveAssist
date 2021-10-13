import 'package:get/get.dart';

import '../controllers/explore_nearby_controller.dart';

class ExploreNearbyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreNearbyController>(
      () => ExploreNearbyController(),
    );
  }
}
