import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/auth_service.dart';
import '../controllers/logged_in_profile_controller.dart';

class LoggedInProfileView extends GetView<LoggedInProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AuthService());
    Get.put(LoggedInProfileController());
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('LoggedInProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            Text(
              user.displayName!,
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(onPressed: controller.onTapLogOut, child: Text('logout'))
          ],
        ),
      ),
    );
  }
}
