import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/theme/ui_helpers.dart';
import '../../../core/values/assets.dart';
import '../../../data/services/auth_service.dart';
import '../../../widgets/loader.dart';
import '../controllers/logged_in_profile_controller.dart';
import '../widgets/travel_plan_card.dart';

class LoggedInProfileView extends GetView<LoggedInProfileController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    Get.put(AuthService());
    Get.put(LoggedInProfileController());

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 104.0),
          child: ElevatedButton.icon(
            onPressed: controller.onTapAddNavigation,
            icon: Icon(Icons.add_road),
            label: Text('Add Travel Plan'),
          ),
        ),
        body: ListView(
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
                    Image.asset(
                      kAssetProfileBG,
                    ),
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
                color: Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                  () => controller.travelPlans.isEmpty
                      ? Loader()
                      // : ListView.separated(
                      //     physics: BouncingScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: controller.travelPlans.length,
                      //     itemBuilder: (context, index) => TravelPlanCard(
                      //       travelPlan: controller.travelPlanList[index],
                      //     ),
                      //     separatorBuilder: (context, index) => kVerticalSpaceS,
                      //   ),
                      : GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.travelPlans.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) => TravelPlanCard(
                            travelPlan: controller.travelPlanList[index],
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
