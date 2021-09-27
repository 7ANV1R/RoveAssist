import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            Container(
              child: Center(
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Explore',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Saved',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Profile',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
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
}
