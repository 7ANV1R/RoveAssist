import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/user_profile/travel_note/travel_note_controller.dart';
import 'package:roveassist/app/widgets/snakbar/general_snakbar.dart';

class AddTravelPlan extends GetView<TravelNoteController> {
  const AddTravelPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Travel Plan'),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              controller.travelPlanTitleController.clear();
              controller.travelPlanTextController.clear();
              Get.back();
            },
          ),
          systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
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
                if (controller.travelPlanTitleController.text != "" &&
                    controller.travelPlanTextController.text != "") {
                  controller.onTapAddNewNote(
                      controller.travelPlanTitleController.text, controller.travelPlanTextController.text);
                  controller.travelPlanTitleController.clear();
                  controller.travelPlanTextController.clear();
                } else if (controller.travelPlanTitleController.text == "" &&
                    controller.travelPlanTextController.text != "") {
                  controller.onTapAddNewNote('Untitled', controller.travelPlanTextController.text);
                  controller.travelPlanTitleController.clear();
                  controller.travelPlanTextController.clear();
                } else {
                  showGeneralSnakbar(
                    message: 'Details are required',
                    backgroundColor: Colors.red,
                    icon: Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.white,
                    ),
                  );
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
                style: _textTheme.headline6,
                controller: controller.travelPlanTitleController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.title),
                  ),
                  hintText: 'Title',
                  labelStyle: TextStyle(
                    color: _themeData.primaryColor,
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              kVerticalSpaceXS,
              TextFormField(
                autofocus: true,
                style: _textTheme.bodyText1,
                maxLines: 20,
                controller: controller.travelPlanTextController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  hintText: 'Travel Plan Details',
                  labelStyle: TextStyle(
                    color: _themeData.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
