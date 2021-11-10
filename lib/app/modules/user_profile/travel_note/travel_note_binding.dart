import 'package:get/get.dart';

import 'travel_note_controller.dart';

class TravelNoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TravelNoteController>(
      () => TravelNoteController(),
    );
  }
}
