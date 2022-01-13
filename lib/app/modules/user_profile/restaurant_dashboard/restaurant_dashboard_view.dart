import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/user_profile/restaurant_dashboard/widgets/restaurant_dash_card.dart';
import 'package:roveassist/app/widgets/default_button.dart';

import 'restaurant_dashboard_controller.dart';

class RestaurantDashboardView extends GetView<RestaurantDashboardController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    final isDial = ValueNotifier(true);
    return Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        floatingActionButton: SpeedDial(
          openCloseDial: isDial,
          backgroundColor: _themeData.primaryColor,
          overlayColor: Colors.black,
          overlayOpacity: 0.6,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(color: Colors.white),
          children: [
            SpeedDialChild(
              labelWidget: DefaultButton(
                onTap: () async {
                  isDial.value = false;
                  // controller.onTapAddTourPackage();
                },
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: _themeData.primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                label: Text(
                  'Create Restaurant',
                  style: _textTheme.button!.copyWith(color: _themeData.cardColor),
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('Restaurant'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Obx(() => ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    kVerticalSpaceM,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.myRestaurantList.length,
                      itemBuilder: (context, index) => RestaurantDashCard(
                        restaurant: controller.myRestaurantList[index],
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
