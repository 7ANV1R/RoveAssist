import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/database_services.dart';
import '../../../widgets/loader.dart';
import '../controllers/profile_controller.dart';
import '../widgets/auth_screen.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: Loader());
              else if (snapshot.hasData) {
                Get.put(DatabaseService());
                return AuthPage();

                // return LoggedInProfileView();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              } else {
                return AuthPage();
              }
            }),
      ),
    );
  }
}
