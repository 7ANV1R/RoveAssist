import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MapView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
