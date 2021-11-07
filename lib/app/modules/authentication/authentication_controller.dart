import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/data/services/user_auth_services.dart';
import 'package:roveassist/app/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  final StorageService _storageService = Get.find<StorageService>();

  final UserAuthServices _userAuthServices = Get.find<UserAuthServices>();
  @override
  Future<void> onInit() async {
    await GetStorage.init();
    super.onInit();
  }

  @override
  void onReady() {
    if (_storageService.authToken != null) {
      Get.offAllNamed(Routes.NAV_SERVICE);
    }
    super.onReady();
  }

  @override
  void onClose() {}

  void checkAlreadyLoggedIn() {
    if (_storageService.authToken != null) {
      Get.offAllNamed(Routes.NAV_SERVICE);
    }
  }

  //For login page:
  final RxBool _loginPage = RxBool(true);
  bool get loginPage => _loginPage.value;

  //For signup page :
  final RxBool _signupPage = RxBool(false);
  bool get signupPage => _signupPage.value;

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide Proper email";
    }
    return null;
  }

  bool checkValid() {
    final isValid = signUpFormKey.currentState!.validate();
    if (!isValid) {
      return true;
    } else {
      signUpFormKey.currentState!.save();
      return false;
    }
  }

  Future<void> onTapAlreadyMember() async {
    _loginPage.value = true;
    _signupPage.value = false;
  }

  Future<void> onTapNewMember() async {
    _loginPage.value = false;
    _signupPage.value = true;
  }

  Future<void> onTapLogIn(String email, String password) async {
    _userAuthServices.onLogIn(email, password);
  }

  Future<void> onTapSignUp(String username, String email, String password) async {
    _userAuthServices.onSignUp(username, email, password);
  }
}
