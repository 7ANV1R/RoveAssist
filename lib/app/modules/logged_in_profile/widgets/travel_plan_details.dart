import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';

import '../../../data/models/travel_plan/travel_plan.dart';
import '../controllers/logged_in_profile_controller.dart';

class TravelPlanDetails extends GetView<LoggedInProfileController> {
  const TravelPlanDetails({Key? key, required this.travelPlan}) : super(key: key);
  final TravelPlanModel travelPlan;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
          actions: [
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Edited : ${controller.formattedDateTime(travelPlan.timeCreated!)}'),
            )),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {},
              icon: Icon(Icons.delete_sweep_rounded),
              label: Text('Delete'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit_road_outlined),
              label: Text('Update Plan'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(travelPlan.title!, style: _textTheme.headline5),
              Divider(),
              kVerticalSpaceXS,
              Text(travelPlan.content!, style: _textTheme.bodyText1),
            ],
          ),
        ));
  }
}
