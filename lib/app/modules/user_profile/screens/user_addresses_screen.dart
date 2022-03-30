import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';
import 'package:sese/app/modules/user_profile/widgets/address_card.dart';
import 'package:sese/app/routes/app_routes.dart';

class UserAddressesScreen extends StatelessWidget {
  UserProfileController userProfileController = Get.find();
  UserAddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: TextButton(
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.backIcon,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text("My addresses",
              style: CustomTextStyle.h4(AppColors.primaryColor)),
          elevation: 0.5,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Obx(()=>
               Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: userProfileController.countAddress.value != 0
                    ? GridView.builder(
                        itemCount: userProfileController.listAddresses.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (BuildContext context, int i) {
                          userProfileController.getFullAddress(i);
                          return AddressCard(
                              onPressed: () {
                                Get.toNamed(AppRoutes.userEditAddress);
                                userProfileController.currentIndexAddress.value =
                                    i;
                              },
                              defaultButton: userProfileController
                                      .listAddresses[i]["isDefault"] ??
                                  false,
                              name: userProfileController.listAddresses[i][
                                "name"
                              ]??"",
                              phoneNumber: userProfileController.listAddresses[i]
                                      ["phoneNumber"] ??
                                  "",
                              address: userProfileController.listAddresses[i]
                                      ["fullAddress"] ??
                                  "");
                        })
                    : Container(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.userNewAddress);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.greenColor,
                        width: 1.2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "+ Add Address",
                      style: CustomTextStyle.t4(AppColors.darkGreyColor),
                    )),
                  )),
            )
          ],
        ));
  }
}
