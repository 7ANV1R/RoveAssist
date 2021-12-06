import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/modules/home_page/home_page_controller.dart';
import 'package:roveassist/app/modules/home_page/home_page_view.dart';
import 'package:roveassist/app/modules/hotel_page/hotel_page_controller.dart';
import 'package:roveassist/app/modules/hotel_page/hotel_page_view.dart';
import 'package:roveassist/app/modules/sign_up_page/sign_up_page_controller.dart';
import 'package:roveassist/app/modules/sign_up_page/sign_up_page_view.dart';
import 'package:roveassist/app/modules/tour_package/tour_package_controller.dart';
import 'package:roveassist/app/modules/tour_package/tour_package_view.dart';
import 'package:roveassist/app/modules/travel_note/travel_note_controller.dart';
import 'package:roveassist/app/modules/travel_note/travel_note_view.dart';
import 'package:roveassist/app/modules/user_profile/user_profile_controller.dart';
import 'package:roveassist/app/modules/user_profile/user_profile_view.dart';

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
            homePage(),
            hotelPage(),
            travelNotePage(),
            userProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => FancyBottomNavigation(
            tabs: [
              TabData(iconData: Icons.directions, title: 'Home'),
              TabData(iconData: Icons.home_work, title: 'Hotel'),
              TabData(iconData: Icons.loyalty, title: 'Note'),
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

  UserProfileView userProfileView() {
    Get.lazyPut<UserProfileController>(
      () => UserProfileController(),
    );
    Get.put(UserProfileController());
    Get.lazyPut<StorageService>(() => StorageService());
    return UserProfileView();
  }

  SignUpPageView signupView() {
    Get.lazyPut<SignUpPageController>(
      () => SignUpPageController(),
    );
    Get.lazyPut<StorageService>(() => StorageService());
    return SignUpPageView();
  }

  HomePageView homePage() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    return HomePageView();
  }

  HotelPageView hotelPage() {
    Get.lazyPut<HotelPageController>(
      () => HotelPageController(),
    );

    return HotelPageView();
  }

  TourPackageView tourPackagePage() {
    Get.lazyPut<TourPackageController>(
      () => TourPackageController(),
    );

    return TourPackageView();
  }

  TravelNoteView travelNotePage() {
    Get.lazyPut<TravelNoteController>(
      () => TravelNoteController(),
    );

    return TravelNoteView();
  }
}
