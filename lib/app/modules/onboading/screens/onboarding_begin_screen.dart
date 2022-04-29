import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class OnboardingBeginScreen extends StatelessWidget {
  const OnboardingBeginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 108, 59, 1),
      body: GestureDetector(
        onTap: () => Get.offNamed(AppRoutes.onBoardingContent1),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset('assets/images/logo_onboarding.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
