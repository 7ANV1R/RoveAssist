import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/core/values/assets.dart';
import 'package:roveassist/app/widgets/loader.dart';

import '../../../data/services/auth_service.dart';
import '../controllers/logged_in_profile_controller.dart';

class LoggedInProfileView extends GetView<LoggedInProfileController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    var screenSize = MediaQuery.of(context).size;
    Get.put(AuthService());
    Get.put(LoggedInProfileController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(color: _themeData.secondaryHeaderColor),
        ),
        centerTitle: true,
        leading: BackButton(color: _themeData.secondaryHeaderColor),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz,
                color: _themeData.secondaryHeaderColor,
              ))
        ],
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              kVerticalSpaceS,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(kAssetProfileBG),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          controller.user!.photoURL!,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ],
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
              kVerticalSpaceM,
              TextField(
                controller: controller.addController,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.user!.displayName!,
                      style: _textTheme.headline2!.copyWith(color: _themeData.secondaryHeaderColor),
                    ),
                    Text(
                      controller.user!.email!,
                      style: _textTheme.bodyText1!.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              kVerticalSpaceM,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Obx(() => controller.travelPlans.isEmpty
                      ? Loader()
                      : GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.travelPlans.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                color: _themeData.primaryColor, borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                controller.travelPlans[index].content!,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            //top: screenSize.height * 0.7,
            child: ElevatedButton.icon(
              onPressed: () {
                if (controller.addController.text != "") {
                  controller.onTapAddTravelPlan(controller.addController.text, controller.addController.text);
                  controller.addController.clear();
                }
              },
              icon: Icon(Icons.add_road),
              label: Text('Add Travel Plan'),
            ),
          ),
        ],
      ),

      // body: ListView(
      //   children: [
      //     kVerticalSpaceXXXL,
      //     ClipRRect(
      //       borderRadius: BorderRadius.circular(8),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.grey[400],
      //         ),
      //         child: Image.network(
      //           user!.photoURL!,
      //           height: 90,
      //           width: 90,
      //         ),
      //       ),
      //     ),
      //     kVerticalSpaceL,
      //     Text(
      //       user.displayName!,
      //       style: _textTheme.headline6,
      //     ),
      //     Text(
      //       user.email!,
      //       style: _textTheme.bodyText1,
      //     ),
      //     kVerticalSpaceS,
      //     ElevatedButton(
      //       onPressed: controller.onTapLogOut,
      //       child: Text('logout'),
      //     ),
      //     kVerticalSpaceXXL,
      //     TextFormField(
      //       controller: controller.addController,
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         if (controller.addController.text != "") {
      //           controller.onTapAddTravelPlan(controller.addController.text, controller.addController.text);
      //           controller.addController.clear();
      //         }
      //       },
      //       child: Text('Add Travel Plan'),
      //     ),
      //     Obx(
      //       () => controller.travelPlanList.isEmpty
      //           ? Container()
      //           : ListView.builder(
      //               itemCount: controller.travelPlans.length,
      //               shrinkWrap: true,
      //               physics: BouncingScrollPhysics(),
      //               itemBuilder: (context, index) => Text(controller.travelPlans[index].content!),
      //             ),
      //     ),
      //   ],
      // ),
    );
  }
}
