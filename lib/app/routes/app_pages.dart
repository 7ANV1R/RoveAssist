import 'package:get/get.dart';

import 'package:roveassist/app/modules/logged_in_profile/bindings/logged_in_profile_binding.dart';
import 'package:roveassist/app/modules/logged_in_profile/views/logged_in_profile_view.dart';

import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/explore_nearby/bindings/explore_nearby_binding.dart';
import '../modules/home/explore_nearby/views/explore_nearby_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/nav_service/bindings/nav_service_binding.dart';
import '../modules/nav_service/views/nav_service_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/saved/bindings/saved_binding.dart';
import '../modules/saved/views/saved_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.NAV_SERVICE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.EXPLORE_NEARBY,
          page: () => ExploreNearbyView(),
          binding: ExploreNearbyBinding(),
        ),
      ],
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
    GetPage(
      name: _Paths.LOGGED_IN_PROFILE,
      page: () => LoggedInProfileView(),
      binding: LoggedInProfileBinding(),
    ),
  ];
}
