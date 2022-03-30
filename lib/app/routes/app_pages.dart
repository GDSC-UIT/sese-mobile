import 'package:get/get.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_binding.dart';
import 'package:sese/app/modules/edit_profile/screens/change_link_accounts_screen.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_dob_screen.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_email_screen.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_gender_screen.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_name_screen.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_phone_number.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_university_screen.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_user_profile_screen.dart';
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
import 'package:sese/app/modules/post_product/screens/post_product_add_category_screen.dart';
import 'package:sese/app/modules/post_product/screens/post_product_begin_screen.dart';
import 'package:sese/app/modules/post_product/screens/post_product_fail_screen.dart';
import 'package:sese/app/modules/post_product/screens/post_product_info_screen.dart';
import 'package:sese/app/modules/post_product/screens/post_product_location_screen.dart';
import 'package:sese/app/modules/post_product/screens/post_product_price_screen.dart';
import 'package:sese/app/modules/post_product/screens/post_product_success_screen.dart';
import 'package:sese/app/modules/post_product/screens/post_product_waiting_screen.dart';
import 'package:sese/app/modules/search/screens/search_screen.dart';
import 'package:sese/app/modules/search/search_binding.dart';
import 'package:sese/app/modules/user_profile/screens/user_profile_screen.dart';
import 'package:sese/app/modules/user_profile/user_profile_binding.dart';

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
      page: () => EditNameScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editEmail,
      transition: Transition.leftToRight,
      page: () => EditEmailScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editGender,
      transition: Transition.leftToRight,
      page: () => EditGenderScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editDateOfBirth,
      transition: Transition.leftToRight,
      page: () => EditDateOfBirthScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editPhoneNumber,
      transition: Transition.leftToRight,
      page: () => EditPhoneNumberScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editUniversity,
      transition: Transition.leftToRight,
      page: () => EditUniversityScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editLinkAccount,
      transition: Transition.leftToRight,
      page: () => ChangeLinkAccountScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    //user profile
    GetPage(
      name: AppRoutes.userProfile,
      transition: Transition.leftToRight,
      page: () => UserProfileScreen(),
      binding: UserProfileBinding(),
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
    GetPage(
      name: AppRoutes.postProductPrice,
      transition: Transition.leftToRight,
      page: () => PostProductPriceScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductCategory,
      transition: Transition.leftToRight,
      page: () => PostProductCategoryScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductLocation,
      transition: Transition.leftToRight,
      page: () => PostProductLocationScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductWaiting,
      transition: Transition.leftToRight,
      page: () => const PostProductWaitingScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductSuccess,
      transition: Transition.leftToRight,
      page: () => const PostProductSuccessScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductFail,
      transition: Transition.leftToRight,
      page: () => const PostProductFailScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    //search
    GetPage(
      name: AppRoutes.search,
      transition: Transition.leftToRight,
      page: () => SearchScreen(),
      binding: SearchBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
