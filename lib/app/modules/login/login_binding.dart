import 'package:get/get.dart';
import 'package:sese/app/data/services/auth_service.dart';
import './login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
