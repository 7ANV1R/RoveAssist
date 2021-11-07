import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/ui_helpers.dart';
import '../../core/values/assets.dart';
import '../../widgets/default_button.dart';
import 'login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset(
              kAssetOnboarding3,
              height: screenSize.height * 0.3,
            ),
            Text(
              'Hey,\nLogin Now.',
              style: _textTheme.headline3!.copyWith(color: _themeData.primaryColor),
            ),
            kVerticalSpaceM,
            Form(
              child: Column(
                children: [
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
                    obscureText: true,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined),
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
                if (controller.emailTextController.text != "" && controller.passwordController.text != "") {
                  controller.onTapLogIn(
                      controller.emailTextController.text, controller.passwordController.text);
                }
              },
              label: Text(
                'LOGIN',
                style: _textTheme.button!.copyWith(color: _themeData.scaffoldBackgroundColor),
              ),
              color: _themeData.primaryColor,
              //padding: EdgeInsets.symmetric(horizontal: 60.0),
            ),
            Row(
              children: [
                Text('If you are new /'),
                TextButton(
                  onPressed: controller.onTapSignUp,
                  child: Text('Sign up'),
                ),
              ],
            ),
            Container(
              height: screenSize.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
