import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/modules/logged_in_profile/controllers/logged_in_profile_controller.dart';

class AddTravelPlan extends GetView<LoggedInProfileController> {
  const AddTravelPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: controller.travelPlanTitleController,
          ),
          TextField(
            controller: controller.travelPlanTextController,
          ),
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
    );
  }
}
