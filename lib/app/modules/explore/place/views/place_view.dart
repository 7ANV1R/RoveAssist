import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/place_controller.dart';

class PlaceView extends GetView<PlaceController> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        staggeredTileBuilder: (index) =>
            StaggeredTile.count((index % 3 == 0 ? 3 : 1), (index % 3 == 0 ? 2 : 1)),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        itemBuilder: (context, index) => Container(
              height: 80,
              color: Colors.grey,
            ));
  }
}
