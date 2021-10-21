import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/modules/logged_in_profile/widgets/travel_plan_details.dart';

import '../../../data/models/travel_plan/travel_plan.dart';
import '../controllers/logged_in_profile_controller.dart';

class TravelPlanCard extends GetView<LoggedInProfileController> {
  TravelPlanCard({Key? key, required this.travelPlan}) : super(key: key);

  final TravelPlanModel travelPlan;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0), //clipping open containder for whole card border radius
      child: OpenContainer(
        closedColor: _themeData.cardColor,
        openColor: _themeData.cardColor,
        closedElevation: 0,
        closedBuilder: (context, action) => ListView(
          padding: EdgeInsets.all(10), //padding of card data
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(travelPlan.title!, style: _textTheme.headline5),
                      Text(travelPlan.content!, style: _textTheme.bodyText1),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        openBuilder: (context, action) => TravelPlanDetails(
          travelPlan: travelPlan,
        ),
      ),
    );
  }
}
