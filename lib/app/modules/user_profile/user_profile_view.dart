import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/modules/user_profile/widgets/profile_custom_tile.dart';

import '../../core/theme/ui_helpers.dart';
import '../../core/values/assets.dart';
import '../../widgets/loader.dart';
import 'user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     'Profile',
        //     style: TextStyle(color: _themeData.secondaryHeaderColor),
        //   ),
        //   centerTitle: true,
        //   leading: BackButton(color: _themeData.secondaryHeaderColor),
        //   actions: [
        //     IconButton(
        //         onPressed: () {},
        //         icon: Icon(
        //           Icons.more_horiz,
        //           color: _themeData.secondaryHeaderColor,
        //         ))
        //   ],
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 104.0),
        //   child: ElevatedButton.icon(
        //     onPressed: () {},
        //     icon: Icon(Icons.add_road),
        //     label: Text('Add Travel Plan'),
        //   ),
        // ),
        body: Column(
          // shrinkWrap: true,
          // physics: BouncingScrollPhysics(),
          children: [
            kVerticalSpaceS,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        kAssetProfileBG,
                      ),
                      Obx(() => controller.userInfo.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: controller.userInfo.first.profileImage == null
                                  ? Container(
                                      height: 70,
                                      width: 70,
                                      child: Center(
                                        child: Text(
                                          controller.userInfo.first.username.substring(0, 1).toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 70,
                                      width: 70,
                                      child: Center(
                                        child: Obx(() => CachedNetworkImage(
                                              imageUrl: controller.userInfo.first.profileImage!,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                              // child: Image.network(
                              //   controller.user!.photoURL!,
                              //   height: 70,
                              //   width: 70,
                              // ),
                            )
                          : Container()),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 60,
                  width: 0.5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: _themeData.primaryColor,
                  ),
                  onPressed: controller.onTapLogOut,
                  child: Text('Sign Out'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => controller.userInfo.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.userInfo.first.username,
                          style: _textTheme.headline2!.copyWith(color: _themeData.secondaryHeaderColor),
                        ),
                        Text(
                          controller.userInfo.first.email,
                          style: _textTheme.bodyText1!.copyWith(color: Colors.grey),
                        ),
                      ],
                    )
                  : Loader()),
            ),
            Obx(() => controller.userInfo.isNotEmpty
                ? Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
                        color: Colors.grey[200],
                      ),
                      // child: Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: Obx(() => controller.userInfo.isNotEmpty && controller.userInfo.first.isAgent
                      //       ? Text('Add New Hotel')
                      //       : Container()),
                      // ),
                      child: Column(
                        children: [
                          kVerticalSpaceS,
                          Obx(() => controller.userInfo.first.isAgent
                              ? ProfileMenuTile(
                                  onTap: () {},
                                  icon: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100.0),
                                          color: Colors.red[50],
                                        ),
                                      ),
                                      Icon(
                                        Icons.hotel,
                                        color: Colors.red[600],
                                      ),
                                    ],
                                  ),
                                  title: 'Hotel',
                                  trailing: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      Icon(Icons.chevron_right),
                                    ],
                                  ),
                                )
                              : Container()),
                          Obx(() => controller.userInfo.first.isAgent
                              ? ProfileMenuTile(
                                  onTap: () {},
                                  icon: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100.0),
                                          color: Colors.red[50],
                                        ),
                                      ),
                                      Icon(
                                        Icons.tour,
                                        color: Colors.red[600],
                                      ),
                                    ],
                                  ),
                                  title: 'Tour Package',
                                  trailing: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      Icon(Icons.chevron_right),
                                    ],
                                  ),
                                )
                              : Container()),
                          ProfileMenuTile(
                            onTap: controller.onTapTravelNote,
                            icon: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.red[50],
                                  ),
                                ),
                                Icon(
                                  Icons.note_add,
                                  color: Colors.red[600],
                                ),
                              ],
                            ),
                            title: 'Travel Note',
                            trailing: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                          ProfileMenuTile(
                            onTap: () {},
                            icon: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: Colors.green[50],
                                  ),
                                ),
                                Icon(
                                  Icons.place,
                                  color: Colors.green[600],
                                ),
                              ],
                            ),
                            title: 'Place',
                            trailing: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.grey[300],
                                  ),
                                ),
                                Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                          Obx(() => controller.userInfo.first.isAgent
                              ? Container()
                              : ProfileMenuTile(
                                  onTap: controller.onTapBecomeAgent,
                                  icon: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100.0),
                                          color: Colors.red[50],
                                        ),
                                      ),
                                      Icon(
                                        Icons.support_agent,
                                        color: Colors.red[600],
                                      ),
                                    ],
                                  ),
                                  title: 'Become an agent',
                                  trailing: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      Icon(Icons.chevron_right),
                                    ],
                                  ),
                                )),
                        ],
                      ),
                    ),
                  )
                : Loader())
          ],
        ),
      ),
    );
  }
}
