import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/widgets/loader.dart';

import 'user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => controller.userInfo.isNotEmpty
                  ? Column(
                      children: [
                        Text(
                          '${controller.userInfo.first.username} is working',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '${controller.userInfo.first.email}',
                          style: TextStyle(fontSize: 20),
                        ),
                        controller.userInfo.first.companyName != "Not Found"
                            ? Text(
                                '${controller.userInfo.first.companyName}',
                                style: TextStyle(fontSize: 20),
                              )
                            : Container(),
                      ],
                    )
                  : Loader(),
            ),
            ElevatedButton(onPressed: controller.fetchUserInfo, child: Text("user info")),
            ElevatedButton(onPressed: controller.onTapLogOut, child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
