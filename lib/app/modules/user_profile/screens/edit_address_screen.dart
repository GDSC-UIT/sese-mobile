import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';

class EditAddressScreen extends StatefulWidget {
  EditAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  UserProfileController userProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    var index = userProfileController.currentIndexAddress.value;
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
        title: Text("New Address",
            style: CustomTextStyle.h4(AppColors.primaryColor)),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //name
              Text(
                "Name",
                style: CustomTextStyle.t4(AppColors.lightGreyColor),
              ),
              InPutTextField(
                hintText: userProfileController.listAddresses[index]["name"],
                controller: userProfileController.userName.value,
                isEnable: true,
              ),
              const SizedBox(
                height: 12,
              ),
              //Phone number
              Text(
                "Phone Number",
                style: CustomTextStyle.t4(AppColors.lightGreyColor),
              ),
              InPutTextField(
                hintText: userProfileController.listAddresses[index]
                    ["phoneNumber"],
                controller: userProfileController.userPhoneNumber.value,
                isEnable: true,
              ),
              const SizedBox(
                height: 12,
              ),
              //City

              Text(
                "City",
                style: CustomTextStyle.t4(AppColors.lightGreyColor),
              ),
              InPutTextField(
                hintText: userProfileController.listAddresses[index]["city"],
                controller: userProfileController.city.value,
                isEnable: true,
              ),
              const SizedBox(
                height: 12,
              ),
              //district
              Text(
                "District",
                style: CustomTextStyle.t4(AppColors.lightGreyColor),
              ),
              InPutTextField(
                hintText: userProfileController.listAddresses[index]
                    ["district"],
                controller: userProfileController.district.value,
                isEnable: true,
              ),
              const SizedBox(
                height: 12,
              ),
              //Ward
              Text(
                "Ward",
                style: CustomTextStyle.t4(AppColors.lightGreyColor),
              ),
              InPutTextField(
                hintText: userProfileController.listAddresses[index]["ward"],
                controller: userProfileController.ward.value,
                isEnable: true,
              ),
              const SizedBox(
                height: 12,
              ),
              //street_building name
              Text(
                "Street/Building Name",
                style: CustomTextStyle.t4(AppColors.lightGreyColor),
              ),
              InPutTextField(
                hintText: userProfileController.listAddresses[index]
                    ["streetBuildingName"],
                controller: userProfileController.streetBuildingName.value,
                isEnable: true,
              ),
              const SizedBox(
                height: 12,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Set as Default Address",
                    style: CustomTextStyle.t2(AppColors.darkGreyColor),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Switch(
                      onChanged: ((value) {
                        setState(() {
                          userProfileController.toggleSwitch(index);
                        });
                      }),
                      value: userProfileController.listAddresses[
                              userProfileController.currentIndexAddress.value]
                          ["isDefault"],
                      activeColor: AppColors.whiteAccentColor,
                      activeTrackColor: AppColors.primaryColor,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Color.fromARGB(66, 238, 103, 103))
                ],
              ),
              AppButton(
                onPress: () {
                  userProfileController.listAddresses.removeAt(index);
                  --userProfileController.countAddress.value;
                  Get.back(); 
                },
                text: "Delete Address",
                borderColor: AppColors.neutralGrey,
                borderThickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPress: () {
                  userProfileController.saveAddress(index);
                  userProfileController.getFullAddress(index);
                  Get.back();
                },
                text: "Save",
                textStyle: CustomTextStyle.t2(AppColors.backIcon),
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
