import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/modules/home/screens/home_screen.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/modules/login/widgets/login_button.dart';
import 'package:sese/app/routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    //check is User loged in
    AuthService.instance.checkLogin();
    print('isLogin: ${AuthService.instance.isLogined}');
    return AuthService.instance.isLogined
        ? HomeScreen()
        : Scaffold(
            backgroundColor: Colors.grey[800],
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset(3, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Center(
                        child: Text('Welcom to SESE app',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 40,
                            )),
                      ),
                    ),
                    Expanded(
                      child: LoginButton(
                        loginController: loginController,
                        textMethod: 'google',
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                          size: 40,
                        ),
                        onPress: () async {
                          await loginController.googleSignInAction();
                          AuthService.instance.isLogined == true
                              ? Get.toNamed(AppRoutes.home,
                                  arguments: ['google'])
                              : print('Login gg fail');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: LoginButton(
                        loginController: loginController,
                        textMethod: 'facebook',
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPress: () async {
                          await loginController.facebookLoginAction();
                          AuthService.instance.isLogined == true
                              ? Get.toNamed(AppRoutes.home,
                                  arguments: ['facebook'])
                              : print('Login fb fail');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
    ;
  }
}
