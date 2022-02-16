import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_enums.dart';
import 'package:sese/app/data/services/auth_service.dart';
import 'package:sese/app/global_widgets/appButton.dart';
import 'package:get/get.dart';
import 'package:sese/app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onPress:
                    AuthService.instance.loginMethod == LoginMethod.facebook
                        ? () {
                            AuthService.instance.faceBookSignOut();
                            Get.offAllNamed(AppRoutes.auth);
                          }
                        : () {
                            AuthService.instance.googleSignOut();
                            Get.offAllNamed(AppRoutes.auth);
                          },
                text: 'Log out')
          ],
        ),
      ),
    );
  }
}
