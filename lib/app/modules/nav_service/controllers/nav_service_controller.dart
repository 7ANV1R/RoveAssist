import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavServiceController extends GetxController {
  late PageController pageController = PageController();
  var currentIndex = 0.obs;
  GlobalKey bottomNavKey = GlobalKey();
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
  }
}
