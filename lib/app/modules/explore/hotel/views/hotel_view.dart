import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/hotel_controller.dart';

class HotelView extends GetView<HotelController> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        staggeredTileBuilder: (index) =>
            StaggeredTile.count((index % 7 == 0 ? 2 : 1), (index % 7 == 0 ? 2 : 1)),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        itemBuilder: (context, index) => Container(
              height: 200,
              color: Colors.grey,
            ));
  }
}
