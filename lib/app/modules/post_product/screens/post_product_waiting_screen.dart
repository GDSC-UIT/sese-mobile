import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class PostProductWaitingScreen extends StatelessWidget {
  const PostProductWaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/post_waiting.png',
              scale: 0.5,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Hang on, your listing is',
              style: CustomTextStyle.h2(
                AppColors.darkGreyColor,
              ),
            ),
            Text(
              'being processed...',
              style: CustomTextStyle.h2(
                AppColors.darkGreyColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
