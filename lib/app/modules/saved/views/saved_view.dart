import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/saved_controller.dart';

class SavedView extends GetView<SavedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SavedView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SavedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
