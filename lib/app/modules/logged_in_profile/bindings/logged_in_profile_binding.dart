import 'package:get/get.dart';

import '../controllers/logged_in_profile_controller.dart';

class LoggedInProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoggedInProfileController>(
      () => LoggedInProfileController(),
    );
  }
}
