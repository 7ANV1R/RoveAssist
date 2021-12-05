import 'package:get/get.dart';
import 'package:roveassist/app/modules/hotel_page/hotel_search_result/hotel_search_result_controller.dart';

class HotelSearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HotelSearchResultController>(
      () => HotelSearchResultController(),
    );
  }
}
