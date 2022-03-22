import 'package:get/get.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostProductController>(() => PostProductController());
  }
}
