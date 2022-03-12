import 'package:flutter/material.dart';
import 'package:sese/app/global_widgets/app_button.dart';

import '../../../core/values/app_colors.dart';

class LoginVerifyBeginScreen extends StatelessWidget {
  const LoginVerifyBeginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
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
                  "Hãy xác thực tài khoản với Se Sẻ nha",
                  style: TextStyle(
                    fontSize: 32,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.08,
                ),
                child: Text(
                  "Mình muốn xác thực bằng:",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.032,
              ),
              AppButton(
                onPress: () {},
                text: "THẺ SINH VIÊN",
                //  textColor: AppColors.primaryColor,
                backgroundColor: AppColors.lightOrange,
                borderColor: AppColors.primaryColor,
              ),
              SizedBox(
                height: _screenHeight * 0.032,
              ),
              AppButton(
                onPress: () {},
                text: "CMND/CCCD",
                // textColor: AppColors.primaryColor,
                backgroundColor: AppColors.lightOrange,
                borderColor: AppColors.primaryColor,
              ),
              SizedBox(
                height: _screenHeight * 0.076,
              ),
              Center(
                child: Text(
                  "Mình sẽ xác thực sau nha",
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColors.greenColor,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
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
