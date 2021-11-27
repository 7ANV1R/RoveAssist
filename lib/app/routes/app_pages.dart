import 'package:get/get.dart';

import '../modules/auth_view/auth_view_binding.dart';
import '../modules/auth_view/auth_view_view.dart';
import '../modules/authentication/authentication_binding.dart';
import '../modules/authentication/authentication_view.dart';

import '../modules/home_page/home_page_binding.dart';
import '../modules/home_page/home_page_view.dart';
import '../modules/hotel_page/hotel_page_binding.dart';
import '../modules/hotel_page/hotel_page_view.dart';
import '../modules/login_page/login_page_binding.dart';
import '../modules/login_page/login_page_view.dart';
import '../modules/nav_service/bindings/nav_service_binding.dart';
import '../modules/nav_service/views/nav_service_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/sign_up_page/sign_up_page_binding.dart';
import '../modules/sign_up_page/sign_up_page_view.dart';
import '../modules/tour_package/tour_package_binding.dart';
import '../modules/tour_package/tour_package_view.dart';
import '../modules/user_profile/become_agent/become_agent_binding.dart';
import '../modules/user_profile/become_agent/become_agent_view.dart';
import '../modules/user_profile/travel_note/travel_note_binding.dart';
import '../modules/user_profile/travel_note/travel_note_view.dart';
import '../modules/user_profile/user_profile_binding.dart';
import '../modules/user_profile/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHENTICATION;
  static const SECONDARY = Routes.NAV_SERVICE;

  static final routes = [
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

    // GetPage(
    //   name: _Paths.LOGGED_IN_PROFILE,
    //   page: () => LoggedInProfileView(),
    //   binding: LoggedInProfileBinding(),
    // ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_PAGE,
      page: () => SignUpPageView(),
      binding: SignUpPageBinding(),
    ),
    GetPage(
        name: _Paths.USER_PROFILE,
        page: () => UserProfileView(),
        binding: UserProfileBinding(),
        children: [
          GetPage(
            name: _Paths.BECOME_AGENT,
            page: () => BecomeAgentView(),
            binding: BecomeAgentBinding(),
          ),
          GetPage(
            name: _Paths.TRAVEL_NOTE,
            page: () => TravelNoteView(),
            binding: TravelNoteBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.AUTH_VIEW,
      page: () => AuthViewView(),
      binding: AuthViewBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_PAGE,
      page: () => HotelPageView(),
      binding: HotelPageBinding(),
    ),
    GetPage(
      name: _Paths.TOUR_PACKAGE,
      page: () => TourPackageView(),
      binding: TourPackageBinding(),
    ),
  ];
}
