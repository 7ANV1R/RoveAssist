import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/user_profile/restaurant_dashboard/restaurant_dashboard_controller.dart';
import 'package:roveassist/app/modules/user_profile/tour_package_dash/tour_package_dash_controller.dart';
import 'package:roveassist/app/widgets/default_button.dart';

class AddRestaurant extends GetView<RestaurantDashboardController> {
  const AddRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    final _size = MediaQuery.of(context).size;
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Restaurant'),
        // bottom: AppBarBottomDivider(),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: showFab
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 88.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.title.text != "" && controller.details.text != "") {
                          controller.postPackageTour(controller.title.text, controller.details.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: _themeData.primaryColor,
                        elevation: 0.0,
                      ),
                      child: Text('Create Restaurant',
                          style: _textTheme.button!.copyWith(color: _themeData.cardColor)),
                    ),
                  ),
                ],
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            TextFormField(
              controller: controller.title,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.view_headline),
                labelText: 'Restaurant Name',
                border: OutlineInputBorder(),
              ),
            ),
            kVerticalSpaceM,
            TextFormField(
              controller: controller.details,
              maxLines: 5,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.description),
                labelText: 'Restaurant Details/Menu',
                border: OutlineInputBorder(),
              ),
            ),
            kVerticalSpaceM,
            // Obx(() => controller.selectedImage == null
            //     ? Container()
            //     : Container(
            //         child: Image.file(controller.selectedImage!),
            //       )),
            DefaultButton(
              onTap: () {
                controller.pickImage();
              },
              color: _themeData.primaryColor,
              padding: EdgeInsets.all(8.0),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.file_upload_outlined,
                    color: Colors.white,
                  ),
                  kHorizontalSpaceM,
                  Text(
                    'Upload Cover Image',
                    style: _textTheme.button!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
