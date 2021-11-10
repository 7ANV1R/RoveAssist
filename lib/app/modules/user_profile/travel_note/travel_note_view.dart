import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import 'travel_note_controller.dart';

class TravelNoteView extends GetView<TravelNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Note'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // StaggeredGridView.countBuilder(
          //   crossAxisCount: 2,
          //   physics: BouncingScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: 5,
          //   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          //   crossAxisSpacing: 16,
          //   mainAxisSpacing: 16,
          //   itemBuilder: (context, index) => TravelPlanCard(
          //     travelPlan: controller.travelPlanList[index],
          //   ),
          // ),
          ElevatedButton(onPressed: controller.userNote, child: Text('Fetch'))
        ],
      ),
    );
  }
}
