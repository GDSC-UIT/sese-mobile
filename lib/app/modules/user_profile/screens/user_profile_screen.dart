import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_bottom_navigation_bar.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';
import 'package:sese/app/modules/user_profile/widgets/column_text.dart';
import 'package:sese/app/modules/user_profile/widgets/product_card.dart';
import 'package:sese/app/routes/app_routes.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileController userProfileController = Get.find();
  UserProfileScreen({Key? key}) : super(key: key);

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
            onPressed: () {
              Get.toNamed(AppRoutes.userSettings);
            },
          )
        ],
        title: Text("Con mòe đáng iu",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            ColumnText(label: "Products", number: "10"),
                            ColumnText(label: "Followers", number: "12"),
                            ColumnText(label: "Following", number: "2"),
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: ColumnText(
                                  label: "Review", number: "4.0/5.0"),
                            ),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AppButton(
                                    onPress: () {
                                      Get.toNamed(AppRoutes.editUserProfile);
                                    },
                                    text: "EDIT PROFILE",
                                    textStyle: CustomTextStyle.t8(Colors.white),
                                    backgroundColor: AppColors.primaryColor,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
              height: 60,
              child: Row(
                children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () {},
                    child: Center(
                        child: Text(
                      "Bought",
                      style: CustomTextStyle.t4(AppColors.darkGreyColor),
                    )),
                  )),
                  Expanded(
                      child: TextButton(
                    onPressed: () {},
                    child: Center(
                        child: Text(
                      "Listing",
                      style: CustomTextStyle.t4(AppColors.darkGreyColor),
                    )),
                  )),
                ],
              ),
            ),
            GridView.builder(
                itemCount: 3,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard();
                })
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}

/*
          body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        children: [
          GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 2.8),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                        child: SizedBox(
                          width: 96,
                          height: 96,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                            radius: 50,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                ColumnText(label: "Products", number: "10"),
                                ColumnText(label: "Followers", number: "12"),
                                ColumnText(label: "Following", number: "2"),
                              ],
                            ),
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: ColumnText(
                                      label: "Review", number: "4.0/5.0"),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AppButton(
                                        onPress: () {
                                          Get.toNamed(
                                              AppRoutes.editUserProfile);
                                        },
                                        text: "EDIT PROFILE",
                                        textStyle:
                                            CustomTextStyle.t8(Colors.white),
                                        backgroundColor: AppColors.primaryColor,
                                      ),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(width: 1, color: Colors.black12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextButton(
                        onPressed: () {},
                        child: Center(
                            child: Text(
                          "Bought",
                          style: CustomTextStyle.t4(AppColors.darkGreyColor),
                        )),
                      )),
                      Expanded(
                          child: TextButton(
                        onPressed: () {},
                        child: Center(
                            child: Text(
                          "Listing",
                          style: CustomTextStyle.t4(AppColors.darkGreyColor),
                        )),
                      )),
                    ],
                  ),
                ),
              ]),
          
      
 */
/*
      
 */