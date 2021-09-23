import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Title 1',
            body: 'Body 1111111111111111111',
          ),
          PageViewModel(
            title: 'Title 2',
            body: 'Body 1111111111111111111',
          ),
        ],
        done: Text('Let\'s go'),
        onDone: () {},
        showNextButton: true,
        next: Text('Next'),
      ),
    ));
  }
}
