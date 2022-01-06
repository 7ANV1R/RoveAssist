import 'package:get/get.dart';

import 'search_results_controller.dart';

class SearchResultsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchResultsController>(
      () => SearchResultsController(),
    );
  }
}
