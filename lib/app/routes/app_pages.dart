import 'package:get/get.dart';
import 'package:sese/app/modules/chat/chat_binding.dart';
import 'package:sese/app/modules/chat/screens/all_chats_screen.dart';
import 'package:sese/app/modules/chat/screens/detail_chat.dart';
import 'package:sese/app/modules/chat/screens/detail_chat_screen.dart';
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
import 'package:sese/app/modules/home/screens/home_all_category_screen.dart';
import 'package:sese/app/modules/home/screens/home_category_screen.dart';
import 'package:sese/app/modules/home/screens/home_detail_product_screen.dart';
import 'package:sese/app/modules/home/screens/home_screen.dart';
import 'package:sese/app/modules/login/login_binding.dart';
import 'package:sese/app/modules/login/screens/login_begin_screen.dart';
import 'package:sese/app/modules/login/screens/login_birth_screen.dart';
import 'package:sese/app/modules/login/screens/login_name_screen.dart';
import 'package:sese/app/modules/login/screens/login_university_screen.dart';
import 'package:sese/app/modules/login/screens/login_email_screen.dart';
import 'package:sese/app/modules/login/screens/login_phone_screen.dart';
import 'package:sese/app/modules/onboading/onboading_binding.dart';
import 'package:sese/app/modules/onboading/screens/onboading_content.dart';
import 'package:sese/app/modules/verify/screens/test_image.dart';
import 'package:sese/app/modules/verify/screens/verify_back_sv_failed_screen.dart';
import 'package:sese/app/modules/verify/screens/verify_back_sv_screen.dart';
import 'package:sese/app/modules/verify/screens/verify_back_sv_success_screen.dart';
import 'package:sese/app/modules/verify/screens/verify_begin_screen.dart';
import 'package:sese/app/modules/verify/screens/verify_front_sv_screen.dart';
import 'package:sese/app/modules/verify/screens/verify_front_sv_failed.dart';
import 'package:sese/app/modules/verify/screens/verify_front_sv_success_screen.dart';
import 'package:sese/app/modules/verify/screens/verify_success_screen.dart';
import 'package:sese/app/modules/verify/verify_binding.dart';
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

import '../modules/onboading/screens/onboarding_begin_screen.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    //home page
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.homeAllCategory,
      page: () => HomeAllCategoryScreen(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.homeCategory,
      page: () => HomeCategoryScreen(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.homeDetailProduct,
      page: () => HomeDetailProductScreen(),
      transition: Transition.cupertino,
      binding: HomeBinding(),
    ),
    //auth page
    GetPage(
      name: AppRoutes.authBegin,
      transition: Transition.cupertino,
      page: () => LoginBeginScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authName,
      transition: Transition.cupertino,
      page: () => LoginNameScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authBirth,
      transition: Transition.cupertino,
      page: () => LoginBirthScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authUni,
      transition: Transition.cupertino,
      page: () => LoginUniversityScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authInterest,
      transition: Transition.cupertino,
      page: () => LoginInterestScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authPhone,
      transition: Transition.cupertino,
      page: () => LoginPhoneScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.authEmail,
      transition: Transition.cupertino,
      page: () => LoginEmailScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),

    GetPage(
      name: AppRoutes.verifyBegin,
      transition: Transition.cupertino,
      page: () => VerifyBeginScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifyFrontSv,
      transition: Transition.cupertino,
      page: () => VerifyFrontSvScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifyFrontSvSuccess,
      transition: Transition.cupertino,
      page: () => VerifyFrontSvSuccessScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifyFrontSvFailed,
      transition: Transition.cupertino,
      page: () => VerifyFrontSvFailedScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifyBackSv,
      transition: Transition.cupertino,
      page: () => VerifyBackSvScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifyBackSvSuccess,
      transition: Transition.cupertino,
      page: () => VerifyBackSvSuccessScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifyBackSvFailed,
      transition: Transition.cupertino,
      page: () => VerifyBackSvFailedScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.verifySuccess,
      transition: Transition.cupertino,
      page: () => VerifySuccessScreen(),
      binding: VerifyBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.testImage,
      transition: Transition.cupertino,
      page: () => TestImage(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: AppRoutes.editUserProfile,
      transition: Transition.cupertino,
      page: () => EditUserProfileScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editName,
      transition: Transition.cupertino,
      page: () => EditNameScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editEmail,
      transition: Transition.cupertino,
      page: () => EditEmailScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editGender,
      transition: Transition.cupertino,
      page: () => EditGenderScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editDateOfBirth,
      transition: Transition.cupertino,
      page: () => EditDateOfBirthScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editPhoneNumber,
      transition: Transition.cupertino,
      page: () => EditPhoneNumberScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editUniversity,
      transition: Transition.cupertino,
      page: () => EditUniversityScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.editLinkAccount,
      transition: Transition.cupertino,
      page: () => ChangeLinkAccountScreen(),
      binding: EditProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    //user profile
    GetPage(
      name: AppRoutes.userProfile,
      transition: Transition.cupertino,
      page: () => UserProfileScreen(),
      binding: UserProfileBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    ////post product
    GetPage(
      name: AppRoutes.postProductBegin,
      transition: Transition.cupertino,
      page: () => PostProductBeginScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductInfo,
      transition: Transition.cupertino,
      page: () => PostProductInfoScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductPrice,
      transition: Transition.cupertino,
      page: () => PostProductPriceScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductCategory,
      transition: Transition.cupertino,
      page: () => PostProductCategoryScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductLocation,
      transition: Transition.cupertino,
      page: () => PostProductLocationScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductWaiting,
      transition: Transition.cupertino,
      page: () => const PostProductWaitingScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductSuccess,
      transition: Transition.cupertino,
      page: () => const PostProductSuccessScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.postProductFail,
      transition: Transition.cupertino,
      page: () => const PostProductFailScreen(),
      binding: PostProductBinding(),
      transitionDuration: const Duration(seconds: 1),
    ),
    //search
    GetPage(
      name: AppRoutes.search,
      transition: Transition.cupertino,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
    // chat
    GetPage(
      name: AppRoutes.chatDetail,
      transition: Transition.cupertino,
      page: () => DetailChat(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.allChats,
      transition: Transition.cupertino,
      page: () => AllChatScreen(),
      binding: ChatBinding(),
    ),
    //on boading
    GetPage(
      name: AppRoutes.onBoarding,
      transition: Transition.cupertino,
      page: () => OnboardingBeginScreen(),
      binding: OnboadingBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoardingContent,
      transition: Transition.cupertino,
      page: () => OnboadingContent(),
      binding: OnboadingBinding(),
    ),
  ];
}
