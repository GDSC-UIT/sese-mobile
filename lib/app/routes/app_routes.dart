import 'package:sese/app/modules/edit_profile/screens/edit_dob.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_email.dart';
import 'package:sese/app/modules/edit_profile/screens/edit_phone_number.dart';

abstract class AppRoutes {
  static const home = '/home';
  static const authBegin = '/auth/begin';
  static const authName = '/auth/name';
  static const authBirth = '/auth/birth';
  static const authUni = '/auth/uni';
  static const updateName = '/update/name';

  static const splash = '/splash';
  static const authInterest = '/auth/interest';
  static const authPhone = '/auth/phone';
  static const authEmail = '/auth/email';
  static const authVerifyBegin = '/auth/verifyBegin';

  static const editUserProfile = '/edit/userProfile';
  static const editName = '/edit/name';
  static const editEmail = '/edit/email';
  static const editGender = '/edit/gender';
  static const editDateOfBirth = '/edit/dateOfBirth';
  static const editPhoneNumber = '/edit/phoneNumber';
  static const editLinkAccount = '/edit/linkAccount'; 
}
