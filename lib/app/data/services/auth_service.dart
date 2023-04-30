import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/data/services/theme_service.dart';

class AuthService {
  // Singleton pattern
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();
  String? accessToken = '';

  void readIdToken() async {
    accessToken = ThemeService.box.read('accessToken');
  }

  void saveIdToken(newAccessToken) {
    //accessToken = newAccessToken;
    ThemeService.box.write('accessToken', newAccessToken);
    readIdToken();
    log('acessTokenAuthServiceAfterSave:$accessToken');
    log('save suceess');
  }

  bool get isLogined => FirebaseAuth.instance.currentUser != null;
  User? get currentUser => FirebaseAuth.instance.currentUser;
  LoginMethod loginMethod = LoginMethod.none;

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
        User? user = (await _auth.signInWithCredential(credential)).user;
        return user;
      }
    } catch (e) {
      log('error: $e');
      return null;
    }
    return null;
  }

  Future<User?> googleSignIn() async {
    try {
      var _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth =
          await _googleUser!.authentication;

      var credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth.accessToken,
        idToken: _googleAuth.idToken,
      );

      User? user = (await _auth.signInWithCredential(credential)).user;
      return user;
    } catch (e) {
      log('errorGG: $e');
      return null;
    }
  }

  Future<void> googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> faceBookSignOut() async {
    await _auth.signOut();
    await _facebookAuth.logOut();
  }

  Future<void> checkLogin() async {
    User? user = FirebaseAuth.instance.currentUser;
    log('user:$user');
    if (user != null) {
      if (user.providerData[0].providerId ==
          'google.com') //check the previous login method
      {
        loginMethod = LoginMethod.google;
      } else {
        loginMethod = LoginMethod.facebook;
      }
    }
  }
}
