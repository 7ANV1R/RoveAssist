import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roveassist/app/widgets/loader.dart';

import '../../../../data/models/map_style.dart';
import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Map'),
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
