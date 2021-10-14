import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/assets.dart';
import '../../../data/services/auth_service.dart';
import '../../../widgets/default_button.dart';
import '../controllers/profile_controller.dart';

class AuthPage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthService());
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(kAssetOnboarding3),
            Center(
              child: Text(
                'ROVEASSIST',
                style: _textTheme.headline3!.copyWith(color: _themeData.primaryColor),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Center(child: Text('Sign up to save your travel related plan')),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            DefaultButton(
              onTap: () {},
              label: Text(
                'Login',
                style: _textTheme.button!.copyWith(color: _themeData.scaffoldBackgroundColor),
              ),
              color: _themeData.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            SizedBox(
              height: screenSize.height * 0.015,
            ),
            DefaultButton(
              onTap: controller.onTapSignInWithGoogle,
              label: Text(
                'Sign up',
                style: _textTheme.button!.copyWith(color: _themeData.primaryColor),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: _themeData.primaryColor, width: 2.0),
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ],
        ),
      )),
    );
  }
}
