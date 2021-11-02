import 'package:get/get.dart';
import 'package:roveassist/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  //TODO: Implement LoginPageController

  final count = 0.obs;
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
  void increment() => count.value++;
  final RxBool _isBosecure = RxBool(true);
  bool get isObsecure => _isBosecure.value;
  set isObsecure(bool value) => _isBosecure.value = value;

  Future<void> onTapSignUp() async {
    await Get.toNamed(Routes.SIGN_UP_PAGE);
  }
}
