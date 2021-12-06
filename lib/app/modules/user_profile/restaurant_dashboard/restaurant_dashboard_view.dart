import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'restaurant_dashboard_controller.dart';

class RestaurantDashboardView extends GetView<RestaurantDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RestaurantDashboardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RestaurantDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
