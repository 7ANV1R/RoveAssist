import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/restaurant_controller.dart';

class RestaurantView extends GetView<RestaurantController> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        itemBuilder: (context, index) => Container(
              height: 200,
              color: Colors.grey,
            ));
  }
}
