import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/data/models/travel_note_model.dart';
import 'package:roveassist/app/modules/user_profile/travel_note/travel_note_controller.dart';

class TravelPlanCard extends GetView<TravelNoteController> {
  TravelPlanCard({Key? key, required this.travelPlan}) : super(key: key);

  final TravelNoteModel travelPlan;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    final contentLines = '\n'.allMatches(travelPlan.description).length + 1;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0), //clipping open containder for whole card border radius
      child: OpenContainer(
        closedColor: _themeData.cardColor,
        openColor: _themeData.cardColor,
        closedElevation: 0,
        closedBuilder: (context, action) => ListView(
          padding: EdgeInsets.all(16), //padding of card data
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
                      Text(travelPlan.title, style: _textTheme.headline6),
                      kVerticalSpaceS,
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              baseline: TextBaseline.alphabetic,
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: travelPlan.description.substring(
                                        0,
                                        travelPlan.description.length > 400
                                            ? 400
                                            : travelPlan.description.length),
                                    style: _textTheme.bodyText1,
                                  ),
                                  if (travelPlan.description.length > 400)
                                    TextSpan(
                                      text: '\n...',
                                      style: _textTheme.bodyText1!.copyWith(
                                        color: _themeData.primaryColor,
                                      ),
                                    ),
                                ]),
                              ),
                            ),
                            if (travelPlan.description.length < 400 && contentLines > 4)
                              WidgetSpan(
                                baseline: TextBaseline.alphabetic,
                                child: Text(
                                  '\n...',
                                  style: _textTheme.subtitle1!.copyWith(
                                    color: _themeData.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        openBuilder: (context, action) => Container(),
        // openBuilder: (context, action) => TravelPlanDetails(
        //   travelPlan: travelPlan,
        // ),
      ),
    );
  }
}
