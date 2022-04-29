abstract class AppRoutes {
  static const boading = '/onboading';
  //home route
  static const home = '/home';
  static const homeAllCategory = '/home/allCategory';
  static const homeCategory = '/home/category';
  static const homeDetailProduct = '/home/detailProduct';
  //auth route
  static const authBegin = '/auth/begin';
  static const authName = '/auth/name';
  static const authBirth = '/auth/birth';
  static const authUni = '/auth/uni';
  static const splash = '/splash';
  static const authInterest = '/auth/interest';
  static const authPhone = '/auth/phone';
  static const authEmail = '/auth/email';

  //verify route
  static const verifyBegin = '/verify/begin';
  static const verifyFrontSv = '/verify/frontSv';
  static const verifyFrontSvSuccess = '/verify/frontSvSuccess';
  static const verifyFrontSvFailed = '/verify/frontSvFailed';
  static const verifyBackSv = '/verify/backSv';
  static const verifyBackSvSuccess = '/verify/backSvSuccess';
  static const verifyBackSvFailed = '/verify/backSvFailed';
  static const verifySuccess = '/verify/success';
  static const testImage = '/verify/testImage';

  //edit user route
  static const editUserProfile = '/edit/userProfile';
  static const editName = '/edit/name';
  static const editEmail = '/edit/email';
  static const editGender = '/edit/gender';
  static const editDateOfBirth = '/edit/dateOfBirth';
  static const editPhoneNumber = '/edit/phoneNumber';
  static const editLinkAccount = '/edit/linkAccount';
  static const editUniversity = '/edit/university';

  //post product route
  static const postProductBegin = '/post/product/begin';
  static const postProductInfo = '/post/product/info';
  static const postProductPrice = '/post/product/price';
  static const postProductCategory = '/post/product/category';
  static const postProductLocation = '/post/product/location';
  static const postProductSuccess = '/post/product/success';
  static const postProductFail = '/post/product/fail';
  static const postProductWaiting = '/post/product/waiting';

  //user profile
  static const userProfile = '/user/profile';
  //search product
  static const search = '/search';
  // chat route
  static const chatDetail = '/chat/detail';
  static const allChats = '/chat/all';
}
