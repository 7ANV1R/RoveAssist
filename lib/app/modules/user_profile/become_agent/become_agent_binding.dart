import 'package:get/get.dart';

import 'become_agent_controller.dart';

class BecomeAgentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BecomeAgentController>(
      () => BecomeAgentController(),
    );
  }
}
