import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/services/database_services.dart';
import '../controllers/place_controller.dart';
import '../widgets/place_card.dart';

class PlaceView extends GetView<PlaceController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    Get.put(DatabaseService());
    return Obx(() => ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: controller.placeData.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: _themeData.primaryColor.withOpacity(0.25),
                      blurRadius: 20,
                      offset: Offset(0, 8), //position of shadow
                    ),
                  ],
                ),
                child: PlaceCard(
                  place: controller.placeData[index],
                ),
              ),
            )));
  }
}
