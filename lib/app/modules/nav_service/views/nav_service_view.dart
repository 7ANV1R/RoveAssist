import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/modules/login_page/login_page_controller.dart';
import 'package:roveassist/app/modules/login_page/login_page_view.dart';
import 'package:roveassist/app/modules/sign_up_page/sign_up_page_controller.dart';
import 'package:roveassist/app/modules/sign_up_page/sign_up_page_view.dart';

import '../../../data/services/database_services.dart';
import '../../explore/controllers/explore_controller.dart';
import '../../explore/views/explore_view.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';
import '../../saved/controllers/saved_controller.dart';
import '../../saved/views/saved_view.dart';
import '../controllers/nav_service_controller.dart';

class NavServiceView extends GetView<NavServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: PageView(
          controller: controller.pageController,
          physics: ScrollPhysics(
            parent: NeverScrollableScrollPhysics(),
          ),
          children: [
            homeView(),
            exploreView(),
            savedView(),
            profileView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => FancyBottomNavigation(
            tabs: [
              TabData(iconData: Icons.directions, title: 'Home'),
              TabData(iconData: Icons.space_dashboard_rounded, title: 'Explore'),
              TabData(iconData: Icons.loyalty, title: 'Saved'),
              TabData(iconData: Icons.manage_accounts, title: 'Profile'),
            ],
            onTabChangedListener: (position) {
              controller.currentIndex.value = position;
              controller.pageController.jumpToPage(position);
            },
            initialSelection: controller.currentIndex.value,
            key: controller.bottomNavKey,
          )),
    );
  }

  LoginPageView profileView() {
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
    );
    return LoginPageView();
  }

  SignUpPageView signupView() {
    Get.lazyPut<SignUpPageController>(
      () => SignUpPageController(),
    );
    return SignUpPageView();
  }

  SavedView savedView() {
    Get.lazyPut<SavedController>(
      () => SavedController(),
    );
    return SavedView();
  }

  ExploreView exploreView() {
    Get.lazyPut<ExploreController>(
      () => ExploreController(),
    );
    return ExploreView();
  }

  HomeView homeView() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put(DatabaseService());
    return HomeView();
  }
}
