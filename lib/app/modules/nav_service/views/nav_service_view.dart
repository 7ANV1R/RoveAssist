import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/modules/explore/controllers/explore_controller.dart';
import 'package:roveassist/app/modules/explore/views/explore_view.dart';
import 'package:roveassist/app/modules/home/controllers/home_controller.dart';
import 'package:roveassist/app/modules/home/views/home_view.dart';
import 'package:roveassist/app/modules/profile/controllers/profile_controller.dart';
import 'package:roveassist/app/modules/profile/views/profile_view.dart';
import 'package:roveassist/app/modules/saved/controllers/saved_controller.dart';
import 'package:roveassist/app/modules/saved/views/saved_view.dart';

import '../controllers/nav_service_controller.dart';

class NavServiceView extends GetView<NavServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              TabData(iconData: Icons.backpack, title: 'Home'),
              TabData(iconData: Icons.travel_explore, title: 'Explore'),
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

  ProfileView profileView() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    return ProfileView();
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
    return HomeView();
  }
}
