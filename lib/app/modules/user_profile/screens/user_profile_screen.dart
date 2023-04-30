import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.settings,
              size: 25,
            ),
            color: AppColors.greenColor,
            onPressed: () {},
          )
        ],
        title: Text("Con mòe đáng iu",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(children: [
          SizedBox(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: SizedBox(
                      width: 96,
                      height: 96,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  "10",
                                  style: CustomTextStyle.t3(
                                      AppColors.primaryColor),
                                ),
                                Text(
                                  "Folowers",
                                  style: CustomTextStyle.t6(
                                      AppColors.darkGreyColor),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  "10",
                                  style: CustomTextStyle.t3(
                                      AppColors.primaryColor),
                                ),
                                Text(
                                  "Product",
                                  style: CustomTextStyle.t6(
                                      AppColors.darkGreyColor),
                                ),
                              ],
                            )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          Row(
            children: const [],
          ),
          Row(
            children: const [],
          )
        ]),
      ),
    );
  }
}
