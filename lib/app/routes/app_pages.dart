import 'package:get/get.dart';
import 'package:sese/app/modules/home/home_binding.dart';
import 'package:sese/app/modules/home/screens/home_screen.dart';
import 'package:sese/app/modules/login/login_binding.dart';
import 'package:sese/app/modules/login/screens/login_screen.dart';
import 'package:sese/app/routes/app_routes.dart';
import 'package:sese/app/modules/welcome/welcome_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      transition: Transition.leftToRight,
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.auth,
      transition: Transition.leftToRight,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.welcome,
      transition: Transition.leftToRight,
      page: () => WelcomeScreen(),
    ),
  ];
}
