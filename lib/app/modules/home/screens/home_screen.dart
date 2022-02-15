import 'package:flutter/material.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/global_widgets/appButton.dart';
import 'package:get/get.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/modules/login/login_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, this.loginMethod}) : super(key: key);

  AuthService authService = Get.find();
  String? loginMethod;
  @override
  Widget build(BuildContext context) {
    loginMethod = loginMethod ?? Get.arguments[0];
    print('Home screen');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login success',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              //loginController.name.value,
              'Test',
              style: TextStyle(fontSize: 60),
            ),
            AppButton(
                color: Colors.redAccent,
                onPress: loginMethod == 'facebook'
                    ? () {
                        authService.faceBookSignOut();
                        Get.offAllNamed(AppRoutes.auth);
                      }
                    : () {
                        authService.googleSignOut();
                        Get.offAllNamed(AppRoutes.auth);
                      },
                text: 'Log out')
          ],
        ),
      ),
    );
  }
}
