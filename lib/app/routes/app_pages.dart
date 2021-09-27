import 'package:get/get.dart';

import 'package:roveassist/app/modules/explore/bindings/explore_binding.dart';
import 'package:roveassist/app/modules/explore/views/explore_view.dart';
import 'package:roveassist/app/modules/home/bindings/home_binding.dart';
import 'package:roveassist/app/modules/home/views/home_view.dart';
import 'package:roveassist/app/modules/nav_service/bindings/nav_service_binding.dart';
import 'package:roveassist/app/modules/nav_service/views/nav_service_view.dart';
import 'package:roveassist/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:roveassist/app/modules/onboarding/views/onboarding_view.dart';
import 'package:roveassist/app/modules/profile/bindings/profile_binding.dart';
import 'package:roveassist/app/modules/profile/views/profile_view.dart';
import 'package:roveassist/app/modules/saved/bindings/saved_binding.dart';
import 'package:roveassist/app/modules/saved/views/saved_view.dart';

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
    GetPage(
      name: _Paths.SAVED,
      page: () => SavedView(),
      binding: SavedBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
