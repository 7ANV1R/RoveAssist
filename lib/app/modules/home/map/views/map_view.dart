import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roveassist/app/widgets/loader.dart';

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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(() => controller.isBusy.value
              ? Loader()
              : GoogleMap(
                  onMapCreated: (mapController) => controller.mapController.complete(mapController),
                  initialCameraPosition: controller.initialCameraPosition,
                  myLocationEnabled: true,
                  compassEnabled: false,
                  buildingsEnabled: false,
                  mapToolbarEnabled: false,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                  myLocationButtonEnabled: false,
                )),
        ],
      ),
    );
  }
}
