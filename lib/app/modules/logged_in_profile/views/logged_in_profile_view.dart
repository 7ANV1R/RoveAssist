import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roveassist/app/core/theme/ui_helpers.dart';

import '../../../data/services/auth_service.dart';
import '../controllers/logged_in_profile_controller.dart';

class LoggedInProfileView extends GetView<LoggedInProfileController> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextTheme _textTheme = _themeData.textTheme;
    var screenSize = MediaQuery.of(context).size;
    Get.put(AuthService());
    Get.put(LoggedInProfileController());
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: TextStyle(color: _themeData.secondaryHeaderColor),
        ),
        centerTitle: true,
        leading: BackButton(color: _themeData.secondaryHeaderColor),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: _themeData.secondaryHeaderColor,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            kVerticalSpaceXXXL,
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                ),
                child: Image.network(
                  user!.photoURL!,
                  height: 90,
                  width: 90,
                ),
              ),
            ),
            kVerticalSpaceL,
            Text(
              user.displayName!,
              style: _textTheme.headline6,
            ),
            Text(
              user.email!,
              style: _textTheme.bodyText1,
            ),
            kVerticalSpaceS,
            ElevatedButton(onPressed: controller.onTapLogOut, child: Text('logout'))
          ],
        ),
      ),
    );
  }
}
