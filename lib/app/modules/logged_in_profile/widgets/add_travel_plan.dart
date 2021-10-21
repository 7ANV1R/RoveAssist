import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/logged_in_profile/controllers/logged_in_profile_controller.dart';

class AddTravelPlan extends GetView<LoggedInProfileController> {
  const AddTravelPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add plan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: controller.travelPlanTitleController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.title),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _themeData.primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _themeData.primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: 'Plan Title',
                labelStyle: TextStyle(
                  color: _themeData.primaryColor,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),

              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              //onFieldSubmitted: controller.onTapSearch,
              //validator: controller.searchValidator,
            ),
            kVerticalSpaceM,
            TextFormField(
              controller: controller.travelPlanTextController,
              minLines: 2,
              maxLines: 20,
              decoration: InputDecoration(
                fillColor: Colors.white,
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.description),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _themeData.primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _themeData.primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelText: 'Plan Details',
                labelStyle: TextStyle(
                  color: _themeData.primaryColor,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),

              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              //onFieldSubmitted: controller.onTapSearch,
              //validator: controller.searchValidator,
            ),
            kVerticalSpaceL,
            ElevatedButton.icon(
              onPressed: () {
                if (controller.travelPlanTitleController.text != "" &&
                    controller.travelPlanTextController.text != "") {
                  controller.onTapAddTravelPlan(
                      controller.travelPlanTitleController.text, controller.travelPlanTextController.text);
                  controller.travelPlanTitleController.clear();
                  controller.travelPlanTextController.clear();
                  Get.back();
                }
              },
              icon: Icon(Icons.done),
              label: Text('Save Plan'),
            ),
          ],
        ),
      ),
    );
  }
}
