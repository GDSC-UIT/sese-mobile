import 'package:flutter/material.dart';
import 'package:sese/app/global_widgets/appButton.dart';
import 'package:get/get.dart';
import 'package:sese/app/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome screen',
              style: TextStyle(fontSize: 20),
            ),
            AppButton(
                color: Colors.blueAccent,
                onPress: () {
                  Get.offNamed(AppRoutes.auth);
                },
                text: 'Login to app')
          ],
        ),
      ),
    );
  }
}
