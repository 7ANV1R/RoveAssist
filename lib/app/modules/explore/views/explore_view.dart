import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExploreView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ExploreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
