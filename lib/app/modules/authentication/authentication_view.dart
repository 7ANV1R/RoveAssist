import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';
import 'package:roveassist/app/core/values/assets.dart';
import 'package:roveassist/app/data/services/storage_service.dart';
import 'package:roveassist/app/data/services/user_auth_services.dart';
import 'package:roveassist/app/widgets/default_button.dart';

import 'authentication_controller.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<StorageService>(() => StorageService());
    Get.lazyPut<UserAuthServices>(() => UserAuthServices());
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(
      () => controller.loginPage
          ? Padding(
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
                      if (controller.emailTextController.text != "" &&
                          controller.passwordController.text != "") {
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
                        onPressed: controller.onTapNewMember,
                        child: Text('Sign up'),
                      ),
                    ],
                  ),
                  Container(
                    height: screenSize.height * 0.3,
                  ),
                ],
              ),
            )
          : Padding(
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
                        onPressed: controller.onTapAlreadyMember,
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    ));
  }
}
