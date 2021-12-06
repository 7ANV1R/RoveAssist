import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/payment_form.dart';

class PaymentMethodsController extends GetxController {
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

  Future<void> onTapPaymentMethod() async {
    Get.to(() => PaymentForm(), preventDuplicates: false);
  }

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  TextEditingController usernameTextController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController trxidController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  Future<void> onTapSignUp(String username, String email, String password) async {
    // _userAuthServices.onSignUp(username, email, password);
  }

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

  Future<void> onTapLogIn() async {
    // await Get.toNamed(Routes.LOGIN_PAGE);
  }
}
