import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:roveassist/app/core/values/assets.dart';

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
            image: Image.asset(kAssetOnboarding1),
            decoration: contentDecoration(_textTheme, _themeData),
          ),
          PageViewModel(
            title: 'RoveAssist',
            body: 'Travel is investment in yourself.',
            image: Image.asset(kAssetOnboarding2),
            decoration: contentDecoration(_textTheme, _themeData),
          ),
          PageViewModel(
            title: 'RoveAssist',
            body: 'Never let your memories to greater than your dream.',
            image: Image.asset(kAssetOnboarding3),
            decoration: contentDecoration(_textTheme, _themeData),
          ),
        ],
        done: Container(
          height: 38,
          width: 150,
          decoration: BoxDecoration(
            color: _themeData.primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              'Let\'s go',
              style: TextStyle(color: _themeData.scaffoldBackgroundColor),
            ),
          ),
        ),
        onDone: controller.onTapLetsGo,
        showNextButton: true,
        next: Container(
          height: 38,
          width: 150,
          decoration: BoxDecoration(
            color: _themeData.primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(color: _themeData.scaffoldBackgroundColor),
            ),
          ),
        ),
        dotsDecorator: DotsDecorator(
          spacing: EdgeInsets.all(2),
          activeColor: _themeData.primaryColor,
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    ));
  }

  PageDecoration contentDecoration(TextTheme _textTheme, ThemeData _themeData) {
    return PageDecoration(
      titleTextStyle: _textTheme.headline1!.copyWith(color: _themeData.primaryColor),
      bodyTextStyle: _textTheme.bodyText2!.copyWith(color: _themeData.secondaryHeaderColor),
      bodyAlignment: Alignment.center,
      imageFlex: 2,
      imagePadding: EdgeInsets.only(bottom: 20),
      titlePadding: EdgeInsets.symmetric(vertical: 8),
      descriptionPadding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
    );
  }
}
