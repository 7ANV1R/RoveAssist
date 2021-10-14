import 'package:get/get.dart';

import '../../../data/services/auth_service.dart';

class LoggedInProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future onTapLogOut() async {
    _authService.onTapLogOut();
  }
}
