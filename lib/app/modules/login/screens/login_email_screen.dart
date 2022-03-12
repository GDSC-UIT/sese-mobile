import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';

import '../../../core/values/app_colors.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: _screenHeight * 0.05,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.backIcon,
                  size: 30,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(
                  "Đây là email của mình",
                  style: CustomTextStyle.h2(AppColors.primaryColor),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.028,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.lightGreen,
                    width: 1,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Điền địa chỉ email của bạn',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
