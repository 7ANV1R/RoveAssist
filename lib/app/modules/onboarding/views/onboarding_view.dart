import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OnboardingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'OnboardingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
