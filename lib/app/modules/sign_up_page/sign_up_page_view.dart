import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/ui_helpers.dart';
import '../../core/values/assets.dart';
import '../../widgets/default_button.dart';
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
              kAssetOnboarding1,
              height: screenSize.height * 0.3,
            ),
            Text(
              'Hey,\nSign Up Now.',
              style: _textTheme.headline3!.copyWith(color: _themeData.primaryColor),
            ),
            kVerticalSpaceS,
            Form(
              key: controller.signUpFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    validator: (value) {
                      return controller.validateEmail(value!);
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  kVerticalSpaceM,
                  TextFormField(
                    obscureText: true,
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
                // controller.checkValid();
                if (!controller.checkValid()) {
                  if (controller.usernameTextController.text != "" &&
                      controller.emailTextController.text != "" &&
                      controller.passwordController.text != "") {
                    controller.onTapSignUp(
                      controller.usernameTextController.text,
                      controller.emailTextController.text,
                      controller.passwordController.text,
                    );
                  }
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
                Text('already member? /'),
                TextButton(
                  onPressed: controller.onTapLogIn,
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
