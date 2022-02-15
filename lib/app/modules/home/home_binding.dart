import 'package:get/get.dart';
import 'package:sese/app/data/services/auth_service.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AuthService>(() => AuthService());
  }
}
