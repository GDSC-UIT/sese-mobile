class AppValue {
  static const delayTime = Duration(milliseconds: 500);
  static DateTime minDateTime = DateTime.utc(-271821, 04, 20);
  static DateTime maxDateTime = DateTime.utc(275760, 09, 13);
}

class UrlValue {
  // API endpoints go here
  static const appUrl = 'https://sturee.herokuapp.com';
  static const appUrlLoginSocial = '${UrlValue.appUrl}/api/auth/login/social';
  static const appUrlUpdateUserProfile = '${UrlValue.appUrl}/api/users/me';
  static const appUrlGetAllCategories = '${UrlValue.appUrl}/api/categories';
  static const appUrlVerifyUser =
      '${UrlValue.appUrl}/api/users/me/verification';
  static const appUrlPostProduct = '${UrlValue.appUrl}/api/posts';
}

class FormatValue {
  static const fullDateFormat = 'dd MMMM, yyyy';
  static const monthReducedDateFormat = 'dd MMM, yyyy';
  static const numbericDateFormat = 'dd/MM/yyyy';
  static const onlyDateFormat = 'dd';
  static const dayFormat = 'EEEE';
  static const fullMonthFormat = 'MMMM, yyyy';
  static const shortMonthFormat = 'MM/yyyy';
  static const dayInMonthFormat = 'dd/MM';
  static const yearFormat = 'yyyy';
  static const monthNDayFormat = 'MMMM, yyyy, EEEE';
}
