import 'package:get/get.dart';

import '../../../data/services/auth_service.dart';

class ProfileController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final RxBool _isSignedIn = RxBool(false);
  bool get isSignedIn => _isSignedIn.value;
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

  Future onTapSignInWithGoogle() async {
    await _authService.onTapSignInWithGoogle();
    _isSignedIn.value = true;
  }
}
