import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/restaurant_controller.dart';

class RestaurantView extends GetView<RestaurantController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 1,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          itemBuilder: (context, index) => Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: _themeData.primaryColor.withOpacity(0.15),
                      blurRadius: 20,
                      offset: Offset(0, 8), //position of shadow
                    ),
                  ],
                ),
                child: Center(child: Text('Under Development')),
              )),
    );
  }
}
