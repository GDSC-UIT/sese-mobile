import 'package:get/get.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_binding.dart';
import 'package:sese/app/modules/edit_profile/screens/change_link_accounts.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_dob.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_email.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_gender.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_name.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_phone_number.dart';
import 'package:sese/app/modules/edit_profile/screens/user_profile.dart';
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
import 'package:sese/app/modules/post_product/post_product_binding.dart';
import 'package:sese/app/modules/post_product/post_product_controller.dart';
import 'package:sese/app/modules/post_product/screens/post_product_begin_screen.dart';
import 'package:sese/app/modules/post_product/screens/post_product_info_screen.dart';

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
      name: AppRoutes.editUserProfile,
      transition: Transition.leftToRight,
      page: () => EditUserProfileScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editName,
      transition: Transition.leftToRight,
      page: () => EditName(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editEmail,
      transition: Transition.leftToRight,
      page: () => EditEmail(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editGender,
      transition: Transition.leftToRight,
      page: () => EditGender(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editDateOfBirth,
      transition: Transition.leftToRight,
      page: () => EditDateOfBirth(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editPhoneNumber,
      transition: Transition.leftToRight,
      page: () => EditPhoneNumber(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editLinkAccount,
      transition: Transition.leftToRight,
      page: () => ChangeLinkAccount(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    ////post product
    GetPage(
      name: AppRoutes.postProductBegin,
      transition: Transition.leftToRight,
      page: () => PostProductBeginScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductInfo,
      transition: Transition.leftToRight,
      page: () => PostProductInfoScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
