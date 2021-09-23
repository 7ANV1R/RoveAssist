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
            title: 'RoveAssist',
            body: 'Welcome to roveassist app.',
          ),
          PageViewModel(
            title: 'RoveAssist',
            body: 'Travel is investment in yourself.',
          ),
          PageViewModel(
            title: 'RoveAssist',
            body: 'Never let your memories to greater than your dream.',
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
