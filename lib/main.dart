import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'app/core/theme/app_themes.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    if (GetPlatform.isAndroid) FlutterDisplayMode.setHighRefreshRate();

    return GetMaterialApp(
      title: "RoveAssist",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: getThemeById(context, 1),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      themeMode: ThemeMode.light,
    );
  }
}
