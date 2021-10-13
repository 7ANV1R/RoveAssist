import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../data/models/map_style.dart';
import '../../../../widgets/loader.dart';
import '../controllers/explore_nearby_controller.dart';

class ExploreNearbyView extends GetView<ExploreNearbyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExploreNearbyView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isBusy.value
            ? Center(
                child: Loader(),
              )
            : GoogleMap(
                onMapCreated: (mapController) {
                  controller.mapController.complete(mapController);
                  mapController.setMapStyle(MapStyleJson.mapStyle);
                },
                initialCameraPosition: controller.initialCameraPosition,
                myLocationEnabled: true,
                compassEnabled: false,
                buildingsEnabled: true,
                mapToolbarEnabled: true,
                tiltGesturesEnabled: false,
                rotateGesturesEnabled: true,
                myLocationButtonEnabled: true,
              ),
      ),
    );
  }
}
