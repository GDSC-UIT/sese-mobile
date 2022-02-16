import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService extends GetxController {
  RxBool isLogin = false.obs;
  RxString loginMethod = ''.obs;
  late GoogleSignInAccount? _googleUser;
  late GoogleSignInAuthentication _googleAuth;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<User?> facebookLogin() async {
    try {
      LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );
        //print('auth:$_auth');
        User? user = (await _auth.signInWithCredential(credential)).user;
        isLogin.value = true;
        update();
        return user;
      }
    } catch (e) {
      print('error: $e');
      return null;
    }
  }

  Future<User?> googleSignIn() async {
    try {
      _googleUser = await _googleSignIn.signIn();
      _googleAuth = await _googleUser!.authentication;

      var credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth.accessToken,
        idToken: _googleAuth.idToken,
      );

      User? user = (await _auth.signInWithCredential(credential)).user;

      isLogin.value = true;
      update();
      return user;
    } catch (e) {
      print('errorGG: $e');
      return null;
    }
  }

  Future<void> googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    isLogin.value = false;
    update();
  }

  Future<void> faceBookSignOut() async {
    print('face sign out');

    await _auth.signOut();
    await _facebookAuth.logOut();
    isLogin.value = false;
    update();
  }

  Future<void> checkIsLogin() async {
    User? user = FirebaseAuth.instance.currentUser;
    print('user:$user');
    if (user != null) {
      isLogin.value = true;
      if (user.providerData[0].providerId ==
          'google.com') //check the previous login method
      {
        loginMethod.value = 'google';
      } else {
        loginMethod.value = 'facebook';
      }
    } else {
      isLogin.value = false;
    }
    update();
  }
}
