import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../../core/theme/ui_helpers.dart';
import '../../../widgets/default_button.dart';
import 'tour_package_dash_controller.dart';
import 'widgets/dash_tour_card.dart';

class TourPackageDashView extends GetView<TourPackageDashController> {
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
                  controller.onTapAddTourPackage();
                },
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: _themeData.primaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                label: Text(
                  'Create Tour Package',
                  style: _textTheme.button!.copyWith(color: _themeData.cardColor),
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Text('Tour Package'),
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
                      itemCount: controller.mypackageTourList.length,
                      itemBuilder: (context, index) => DashTourPackCard(
                        packageTourModel: controller.mypackageTourList[index],
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
