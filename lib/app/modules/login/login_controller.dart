import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/data/services/http_service.dart';
import 'dart:convert';

class LoginController extends GetxController {
  RxString loginMethod = ''.obs;
  final AuthService _authService = Get.find();

  Future<void> facebookLoginAction() async {
    try {
      print('sign in with face');
      User? user = await _authService.facebookLogin();
      if (user != null) {
        String idToken = await user.getIdToken(true); //get idToken from user
        print('idToken:$idToken');

        HttpService.postRequest(
            body: jsonEncode(<String, String>{
              'idToken': '$idToken',
            }),
            url: 'https://messchill.herokuapp.com/api/auth/login/social');
      }
    } catch (e) {
      print('fbErorr:$e');
    }
  }

  Future<void> googleSignInAction() async {
    try {
      User? user = await _authService.googleSignIn();
      if (user != null) {
        String idToken = await user.getIdToken(true); //get idToken from user
        print('idToken:$idToken');

        HttpService.postRequest(
            body: jsonEncode(<String, String>{
              'idToken': '$idToken',
            }),
            url: 'https://messchill.herokuapp.com/api/auth/login/social');
      }
    } catch (e) {
      print('errorGG: $e');
    }
  }
}







  // void _updateInfomation(imageUrlUser, nameUser) {
  //   //print('$nameUser and $imageUrlUser');
  //   name.value = nameUser;
  //   imageUrl.value = imageUrlUser;
  //   update();
  // }






// // Future<void> checkIsLogin() async {
// //   User? user = FirebaseAuth.instance.currentUser;
// //   print('user:$user');
// //   if (user != null) {
// //     isLogin.value = true;
// //     _updateInfomation(user.photoURL, user.displayName);

// //     if (user.providerData[0].providerId ==
// //         'google.com') //check the previous login method
// //     {
// //       loginMethod.value = 'google';
// //     } else {
// //       loginMethod.value = 'facebook';
// //     }
// //   } else {
// //     isLogin.value = false;
// //   }

// //   update();
// // }

