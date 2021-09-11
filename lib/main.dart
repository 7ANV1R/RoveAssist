import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get/get.dart';

import 'app/core/theme/app_themes.dart';
import 'app/data/services/storage_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    if (GetPlatform.isAndroid) FlutterDisplayMode.setHighRefreshRate();
    final StorageService _storageService = Get.find<StorageService>();

    return GetMaterialApp(
      title: "RoveAssist",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: getThemeById(context, _storageService.activeThemeId),
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      defaultTransition: Transition.cupertino,
      themeMode: ThemeMode.light,
    );
  }
}
