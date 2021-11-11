import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/data/models/travel_note_model.dart';
import 'package:roveassist/app/modules/user_profile/travel_note/travel_note_controller.dart';

class TravelNoteDetails extends GetView<TravelNoteController> {
  const TravelNoteDetails({Key? key, required this.travelPlan}) : super(key: key);

  final TravelNoteModel travelPlan;

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
              // child: Text('Edited : ${controller.formattedDateTime(travelPlan.timeCreated!)}'),
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
                controller.onDeleteNote(travelPlan.id.toString());
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
                Text(travelPlan.title, style: _textTheme.headline6),
                Divider(),
                kVerticalSpaceXS,
                Text(travelPlan.description, style: _textTheme.bodyText1),
              ],
            ),
          ),
        ));
  }
}
