import 'package:get/get.dart';

import 'auth_view_controller.dart';

class AuthViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthViewController>(
      () => AuthViewController(),
    );
  }
}
