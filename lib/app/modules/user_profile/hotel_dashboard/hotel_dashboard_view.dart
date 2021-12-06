import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'hotel_dashboard_controller.dart';

class HotelDashboardView extends GetView<HotelDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HotelDashboardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HotelDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
