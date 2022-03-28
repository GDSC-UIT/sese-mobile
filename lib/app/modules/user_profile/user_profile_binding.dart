import 'package:get/get.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';

class UserProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileController>(() => UserProfileController());
  }
}
