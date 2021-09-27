import 'package:get/get.dart';
import 'package:roveassist/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
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

  void onTapLetsGo() {
    Get.toNamed(Routes.NAV_SERVICE);
  }
}
