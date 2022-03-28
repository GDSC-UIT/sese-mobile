import 'package:get/get.dart';
import 'package:sese/app/modules/verify/verify_controller.dart';

class VerifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyController>(() => VerifyController());
  }
}
