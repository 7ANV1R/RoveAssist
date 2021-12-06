import 'package:get/get.dart';

import '../modules/auth_view/auth_view_binding.dart';
import '../modules/auth_view/auth_view_view.dart';
import '../modules/authentication/authentication_binding.dart';
import '../modules/authentication/authentication_view.dart';
import '../modules/home_page/home_page_binding.dart';
import '../modules/home_page/home_page_view.dart';
import '../modules/hotel_page/hotel_page_binding.dart';
import '../modules/hotel_page/hotel_page_view.dart';
import '../modules/hotel_page/hotel_search_result/hotel_search_result_binding.dart';
import '../modules/hotel_page/hotel_search_result/hotel_search_result_view.dart';
import '../modules/login_page/login_page_binding.dart';
import '../modules/login_page/login_page_view.dart';
import '../modules/nav_service/bindings/nav_service_binding.dart';
import '../modules/nav_service/views/nav_service_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/payment_methods/payment_methods_binding.dart';
import '../modules/payment_methods/payment_methods_view.dart';
import '../modules/sign_up_page/sign_up_page_binding.dart';
import '../modules/sign_up_page/sign_up_page_view.dart';
import '../modules/tour_package/tour_package_binding.dart';
import '../modules/tour_package/tour_package_view.dart';
import '../modules/travel_note/travel_note_binding.dart';
import '../modules/travel_note/travel_note_view.dart';
import '../modules/user_profile/become_agent/become_agent_binding.dart';
import '../modules/user_profile/become_agent/become_agent_view.dart';
import '../modules/user_profile/hotel_dashboard/hotel_dashboard_binding.dart';
import '../modules/user_profile/hotel_dashboard/hotel_dashboard_view.dart';
import '../modules/user_profile/place_dashboard/place_dashboard_binding.dart';
import '../modules/user_profile/place_dashboard/place_dashboard_view.dart';
import '../modules/user_profile/restaurant_dashboard/restaurant_dashboard_binding.dart';
import '../modules/user_profile/restaurant_dashboard/restaurant_dashboard_view.dart';
import '../modules/user_profile/tour_package_dash/tour_package_dash_binding.dart';
import '../modules/user_profile/tour_package_dash/tour_package_dash_view.dart';
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
      name: _Paths.TRAVEL_NOTE,
      page: () => TravelNoteView(),
      binding: TravelNoteBinding(),
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
            name: _Paths.TOUR_PACKAGE_DASH,
            page: () => TourPackageDashView(),
            binding: TourPackageDashBinding(),
          ),
          GetPage(
            name: _Paths.HOTEL_DASHBOARD,
            page: () => HotelDashboardView(),
            binding: HotelDashboardBinding(),
          ),
          GetPage(
            name: _Paths.PLACE_DASHBOARD,
            page: () => PlaceDashboardView(),
            binding: PlaceDashboardBinding(),
          ),
          GetPage(
            name: _Paths.RESTAURANT_DASHBOARD,
            page: () => RestaurantDashboardView(),
            binding: RestaurantDashboardBinding(),
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
    GetPage(name: _Paths.HOTEL_PAGE, page: () => HotelPageView(), binding: HotelPageBinding(), children: [
      GetPage(
        name: _Paths.HOTEL_SEARCH_RESULT,
        page: () => HotelSearchResultView(),
        binding: HotelSearchResultBinding(),
      ),
    ]),
    GetPage(
      name: _Paths.TOUR_PACKAGE,
      page: () => TourPackageView(),
      binding: TourPackageBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHODS,
      page: () => PaymentMethodsView(),
      binding: PaymentMethodsBinding(),
    ),
  ];
}
