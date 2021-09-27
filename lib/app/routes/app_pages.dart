import 'package:get/get.dart';

import 'package:roveassist/app/modules/home/bindings/home_binding.dart';
import 'package:roveassist/app/modules/home/views/home_view.dart';
import 'package:roveassist/app/modules/nav_service/bindings/nav_service_binding.dart';
import 'package:roveassist/app/modules/nav_service/views/nav_service_view.dart';
import 'package:roveassist/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:roveassist/app/modules/onboarding/views/onboarding_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.NAV_SERVICE,
      page: () => NavServiceView(),
      binding: NavServiceBinding(),
    ),
  ];
}
