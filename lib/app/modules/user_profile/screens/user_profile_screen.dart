import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_bottom_navigation_bar.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';
import 'package:sese/app/modules/user_profile/widgets/column_text.dart';
import 'package:sese/app/modules/user_profile/widgets/sort_button.dart';
import 'package:sese/app/modules/user_profile/widgets/user_profile_bought.dart';
import 'package:sese/app/modules/user_profile/widgets/user_profile_listing.dart';
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
      body: ListView(
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
                            child:
                                ColumnText(label: "Review", number: "4.0/5.0"),
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
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        userProfileController.bought.value = true;
                      },
                      child: Center(
                          child: Text(
                        "Bought",
                        style: CustomTextStyle.t4(AppColors.darkGreyColor),
                      )),
                    )),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        userProfileController.bought.value = false;
                      },
                      child: Center(
                          child: Text(
                        "Listing",
                        style: CustomTextStyle.t4(AppColors.darkGreyColor),
                      )),
                
                    )),
                
                  ],
                  
                ),
              ],
            ),
          ),
          Row(children: [
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.sort_sharp)),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  verticalDirection: VerticalDirection.down,
                  children: [
                    SortButton(
                      onPress: () {},
                      text: "Lowest-Highest",
                    ),
                    SortButton(
                      onPress: () {},
                      text: "Applications",
                    ),
                    SortButton(
                      onPress: () {},
                      text: "Highest-Lowest",
                    )
                  ],
                ),
              ),
            ),
          ]),
          Obx(()=> userProfileController.bought.value?BoughtWidget():ListingWidget()),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
