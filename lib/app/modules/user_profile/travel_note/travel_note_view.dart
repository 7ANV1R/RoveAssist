import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/modules/user_profile/travel_note/widgets/travel_plan_card.dart';

import 'travel_note_controller.dart';

class TravelNoteView extends GetView<TravelNoteController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: _themeData.primaryColor,
        foregroundColor: _themeData.scaffoldBackgroundColor,
        label: Text('Add Travel Note'),
        icon: Icon(Icons.add_road),
      ),
      appBar: AppBar(
        title: Text('Travel Note'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => controller.userNote.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          color: Colors.grey[200],
                          size: 56 * 2,
                        ),
                        Text(
                          'No Notes Found',
                          style: _textTheme.headline6!.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.userNote.length,
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) => TravelPlanCard(
                      travelPlan: controller.userNote[index],
                    ),
                  )),
          ),
          // ElevatedButton(onPressed: controller.userNote, child: Text('Fetch'))
        ],
      ),
    );
  }
}
