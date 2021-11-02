import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/core/values/assets.dart';
import 'package:roveassist/app/widgets/default_button.dart';
import 'package:roveassist/app/widgets/snakbar/general_snakbar.dart';

import 'sign_up_page_controller.dart';

class SignUpPageView extends GetView<SignUpPageController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset(
              kAssetOnboarding3,
              height: screenSize.height * 0.4,
            ),
            Text(
              'Hey,\nSign Up Now.',
              style: _textTheme.headline3!.copyWith(color: _themeData.primaryColor),
            ),
            kVerticalSpaceS,
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.usernameTextController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.badge_outlined),
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kVerticalSpaceM,
                  TextFormField(
                    controller: controller.emailTextController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kVerticalSpaceM,
                  TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            kVerticalSpaceM,
            DefaultButton(
              onTap: () {
                if (controller.usernameTextController.text != "" &&
                    controller.emailTextController.text != "" &&
                    controller.passwordController.text != "") {
                  controller.onTapSignUp(
                    controller.usernameTextController.text,
                    controller.emailTextController.text,
                    controller.passwordController.text,
                  );
                  showGeneralSnakbar(
                    message: 'User Created',
                    backgroundColor: Colors.green,
                    icon: Icon(
                      Icons.done_all,
                      color: Colors.white,
                    ),
                  );
                }
              },
              label: Text(
                'SIGN UP',
                style: _textTheme.button!.copyWith(color: _themeData.scaffoldBackgroundColor),
              ),
              color: _themeData.primaryColor,
              //padding: EdgeInsets.symmetric(horizontal: 60.0),
            ),
            Row(
              children: [
                Text('If you are new /'),
                TextButton(
                  onPressed: () {},
                  child: Text('Sign up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
