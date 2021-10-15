import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';

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
            Expanded(
              child: SizedBox(
                height: screenSize.height * 0.01,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DefaultButton(
                onTap: controller.onTapSignInWithGoogle,
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      size: 20,
                      color: Colors.white,
                    ),
                    kHorizontalSpaceM,
                    Text(
                      'Login with Google',
                      style: _textTheme.button!.copyWith(color: _themeData.scaffoldBackgroundColor),
                    ),
                  ],
                ),
                color: _themeData.primaryColor,
                //padding: EdgeInsets.symmetric(horizontal: 60.0),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
          ],
        ),
      )),
    );
  }
}
