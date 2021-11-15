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
    TextEditingController updatetravelPlanTitleController = TextEditingController(text: travelPlan.title);
    TextEditingController updatetravelPlanTextController =
        TextEditingController(text: travelPlan.description);
    TextEditingController(text: travelPlan.description);
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Obx(() => controller.detailsPlan
            ? detailsView(_textTheme)
            : editNotes(
                updatetravelPlanTitleController, updatetravelPlanTextController, _textTheme, _themeData)
        // return detailsView(_textTheme);
        );
  }

  Widget editNotes(TextEditingController updatetravelPlanTitleController,
      TextEditingController updatetravelPlanTextController, TextTheme _textTheme, ThemeData _themeData) {
    return WillPopScope(
      onWillPop: () async {
        controller.onGetBackFromUpdate();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: controller.onGetBackFromUpdate,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
            actions: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                //child: Text('Edited : ${controller.formattedDateTime(travelPlan.timeCreated!)}'),
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
                  primary: Colors.green,
                ),
                onPressed: () {
                  if (updatetravelPlanTitleController.text != "" &&
                      updatetravelPlanTextController.text != "") {
                    controller.onUpdateandSavePlan(updatetravelPlanTitleController.text,
                        updatetravelPlanTextController.text, travelPlan.id.toString());
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
                  controller: updatetravelPlanTitleController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(Icons.title),
                    ),
                    hintText: '${travelPlan.title}',
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
                  controller: updatetravelPlanTextController,
                  autofocus: true,
                  style: _textTheme.bodyText1,
                  maxLines: 20,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    // suffixIcon: Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: Icon(Icons.title),
                    // ),
                    hintText: '${travelPlan.description}',
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
          )),
    );
  }

  Scaffold detailsView(TextTheme _textTheme) {
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
