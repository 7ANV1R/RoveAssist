import 'package:get/get.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/routes/app_pages.dart';

class UserProfileController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

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

  Future<void> onTapLogOut() async {
    _storageService.authToken = null;
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }
}
