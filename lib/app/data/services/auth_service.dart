import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roveassist/app/widgets/snakbar/general_snakbar.dart';

import '../models/user_model.dart';
import 'database_services.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async {
    return this;
  }

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  Future onTapSignInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      await showGeneralSnakbar(
        message: 'Logged in successfully',
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.login,
          color: Colors.white,
        ),
      );
      UserModel _firebaseUser =
          UserModel(name: _user!.displayName, email: _user!.email, photoURL: _user!.photoUrl);
      await DatabaseService().createNewUser(_firebaseUser);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future onTapLogOut() async {
    googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
