import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  late GoogleSignIn googleSignIn;
  var isSignedIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    googleSignIn = GoogleSignIn();
    ever(isSignedIn, handleAuthStateChange);
    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChange(isLoggedIn) {
    if (isLoggedIn) {
    } else {}
  }
}
