import 'package:get/get.dart';
import 'package:sese/app/modules/onboading/onboading_controller.dart';

class OnboadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboadingController>(() => OnboadingController());
  }
}
