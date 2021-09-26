import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    return Scaffold(
        body: SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'RoveAssist',
            body: 'Welcome to roveassist app.',
            image: Image.asset('assets/images/onboard_image/2.png'),
            decoration: contentDecoration(_textTheme, _themeData),
          ),
          PageViewModel(
            title: 'RoveAssist',
            body: 'Travel is investment in yourself.',
            image: Image.asset('assets/images/onboard_image/1.png'),
            decoration: contentDecoration(_textTheme, _themeData),
          ),
          PageViewModel(
            title: 'RoveAssist',
            body: 'Never let your memories to greater than your dream.',
            image: Image.asset('assets/images/onboard_image/0.png'),
            decoration: contentDecoration(_textTheme, _themeData),
          ),
        ],
        done: Text(
          'Let\'s go',
          style: TextStyle(color: _themeData.primaryColor),
        ),
        onDone: () {},
        showNextButton: true,
        next: Text(
          'Next',
          style: TextStyle(color: _themeData.primaryColor),
        ),
      ),
    ));
  }

  PageDecoration contentDecoration(TextTheme _textTheme, ThemeData _themeData) {
    return PageDecoration(
      titleTextStyle: _textTheme.headline1!.copyWith(color: _themeData.primaryColor),
      bodyTextStyle: _textTheme.subtitle1!.copyWith(color: _themeData.secondaryHeaderColor),
      bodyAlignment: Alignment.center,
    );
  }
}
