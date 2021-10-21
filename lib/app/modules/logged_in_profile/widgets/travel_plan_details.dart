import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/theme/ui_helpers.dart';
import '../../../data/models/travel_plan/travel_plan.dart';
import '../controllers/logged_in_profile_controller.dart';

class TravelPlanDetails extends GetView<LoggedInProfileController> {
  const TravelPlanDetails({Key? key, required this.travelPlan}) : super(key: key);
  final TravelPlanModel travelPlan;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;

    return Obx(() => controller.detailsPlan
        ? PlanDetails(
            controller: controller,
            travelPlan: travelPlan,
            textTheme: _textTheme,
          )
        : UpdatePlan(
            controller: controller,
            travelPlan: travelPlan,
            textTheme: _textTheme,
            themeData: _themeData,
          ));
  }
}

class PlanDetails extends StatelessWidget {
  const PlanDetails({
    Key? key,
    required this.controller,
    required this.travelPlan,
    required TextTheme textTheme,
  })  : _textTheme = textTheme,
        super(key: key);

  final LoggedInProfileController controller;
  final TravelPlanModel travelPlan;
  final TextTheme _textTheme;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                controller.onDeletePlan(travelPlan.planId!);
              },
              icon: Icon(Icons.delete_sweep_rounded),
              label: Text('Delete'),
            ),
            // ElevatedButton.icon(
            //   onPressed: controller.onUpdate,
            //   icon: Icon(Icons.edit_road_outlined),
            //   label: Text('Update Plan'),
            // ),
          ],
        ),
        body: GestureDetector(
          onTap: controller.onUpdate,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                kVerticalSpaceS,
                Text(travelPlan.title!, style: _textTheme.headline5),
                Divider(),
                kVerticalSpaceXS,
                Text(travelPlan.content!, style: _textTheme.bodyText1),
              ],
            ),
          ),
        ));
  }
}

class UpdatePlan extends StatelessWidget {
  const UpdatePlan({
    Key? key,
    required this.controller,
    required this.travelPlan,
    required TextTheme textTheme,
    required ThemeData themeData,
  })  : _textTheme = textTheme,
        _themeData = themeData,
        super(key: key);

  final LoggedInProfileController controller;
  final TravelPlanModel travelPlan;
  final ThemeData _themeData;
  final TextTheme _textTheme;

  @override
  Widget build(BuildContext context) {
    TextEditingController updatetravelPlanTextController =
        TextEditingController(text: '${travelPlan.content!}');
    TextEditingController updatetravelPlanTitleController =
        TextEditingController(text: '${travelPlan.title!}');
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: controller.onGetBackFromUpdate,
          ),
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
              onPressed: () {
                if (updatetravelPlanTitleController.text != "" && updatetravelPlanTextController.text != "") {
                  controller.onUpdateandSavePlan(updatetravelPlanTitleController.text,
                      updatetravelPlanTextController.text, travelPlan.planId!);
                }
              },
              icon: Icon(Icons.description),
              label: Text('Save'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                style: _textTheme.headline5,

                controller: updatetravelPlanTitleController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.title),
                  ),
                  hintText: '${travelPlan.title!}',
                  labelStyle: TextStyle(
                    color: _themeData.primaryColor,
                  ),
                ),

                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                //onFieldSubmitted: controller.onTapSearch,
                //validator: controller.searchValidator,
              ),
              kVerticalSpaceXS,
              TextFormField(
                autofocus: true,
                style: _textTheme.bodyText1,
                maxLines: 20,
                controller: updatetravelPlanTextController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  // suffixIcon: Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: Icon(Icons.title),
                  // ),
                  hintText: '${travelPlan.content!}',
                  labelStyle: TextStyle(
                    color: _themeData.primaryColor,
                  ),
                ),

                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                //onFieldSubmitted: controller.onTapSearch,
                //validator: controller.searchValidator,
              ),
              //Text(travelPlan.content!, style: _textTheme.bodyText1),
            ],
          ),
        ));
  }
}
