import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roveassist/app/data/services/storage_service.dart';

import 'app/core/theme/app_themes.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  final StorageService _storageService = Get.put(StorageService());
  await Firebase.initializeApp();
  await dotenv.load();
  runApp(_storageService.authToken != null ? MyAppLoggedIn() : MyApp());
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

class MyAppLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    if (GetPlatform.isAndroid) FlutterDisplayMode.setHighRefreshRate();

    return GetMaterialApp(
      title: "RoveAssist",
      initialRoute: AppPages.SECONDARY,
      getPages: AppPages.routes,
      theme: getThemeById(context, 1),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      themeMode: ThemeMode.light,
    );
  }
}
