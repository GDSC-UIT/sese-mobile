import 'package:get/get.dart';
import 'package:sese/app/modules/home/home_binding.dart';
import 'package:sese/app/modules/home/screens/home_screen.dart';
import 'package:sese/app/modules/login/login_binding.dart';
import 'package:sese/app/modules/login/screens/login_begin_screen.dart';

import 'package:sese/app/modules/login/screens/login_birth_screen.dart';
import 'package:sese/app/modules/login/screens/login_name_screen.dart';
import 'package:sese/app/modules/login/screens/login_university_screen.dart';

import 'package:sese/app/modules/login/screens/login_email_screen.dart';
import 'package:sese/app/modules/login/screens/login_phone_screen.dart';
import 'package:sese/app/modules/login/screens/login_verify_begin_screen.dart';
import 'package:sese/app/modules/verify/screens/verify_begin_screen.dart';
import 'package:sese/app/modules/verify/screens/verify_front_sv_screen.dart';
import 'package:sese/app/modules/verify/verify_binding.dart';

import 'package:sese/app/routes/app_routes.dart';

import '../modules/login/screens/login_interest_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      transition: Transition.leftToRight,
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.authBegin,
      transition: Transition.leftToRight,
      page: () => LoginBeginScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authName,
      transition: Transition.leftToRight,
      page: () => LoginNameScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authBirth,
      transition: Transition.leftToRight,
      page: () => LoginBirthScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authUni,
      transition: Transition.leftToRight,
      page: () => LoginUniversityScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authInterest,
      transition: Transition.leftToRight,
      page: () => LoginInterestScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authPhone,
      transition: Transition.leftToRight,
      page: () => LoginPhoneScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authEmail,
      transition: Transition.leftToRight,
      page: () => LoginEmailScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authVerifyBegin,
      transition: Transition.leftToRight,
      page: () => LoginVerifyBeginScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifyBegin,
      transition: Transition.leftToRight,
      page: () => VerifyBeginScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifyFrontSv,
      transition: Transition.leftToRight,
      page: () => VerifyFrontSvScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
