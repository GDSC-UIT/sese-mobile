import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/global_widgets/app_button.dart';
import 'package:sese/app/global_widgets/input_text_field.dart';
import 'package:sese/app/modules/user_profile/user_profile_controller.dart';
import 'package:sese/app/modules/user_profile/widgets/input_edit_text_field.dart';

class NewAddressScreen extends StatefulWidget {
  NewAddressScreen({Key? key}) : super(key: key);

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  UserProfileController userProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    var index = userProfileController.countAddress.value;
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
                hintText: "",
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
                hintText: "",
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
                hintText: "",
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
                hintText: "",
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
                hintText: "",
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
                hintText: "",
                controller: userProfileController.streetBuildingName.value,
                isEnable: true,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Set as Default Address",
                  style: CustomTextStyle.t2(AppColors.darkGreyColor),
                ),
                Switch(
                    onChanged: ((value) {
                      setState(() {
                        userProfileController.isDefault.value = value;
                      });
                    }),
                    value: userProfileController.isDefault.value,
                    activeColor: AppColors.whiteAccentColor,
                    activeTrackColor: AppColors.primaryColor,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.black26),
              ]),

              const SizedBox(
                height: 20,
              ),
              AppButton(
                onPress: () {
                  userProfileController.listAddresses.add({
                    "name": "",
                    "phoneNumber": "",
                    "city": "",
                    "district": "",
                    "ward": "",
                    "streetBuildingName": "",
                    "fullAddress": "",
                    "isDefault": false,
                  });
                  userProfileController.getFullAddress(index);
                  userProfileController.saveAddress(index);
                  print(userProfileController.userName.value);
                  ++userProfileController.countAddress.value;
                  Get.back();
                },
                text: "Save",
                textStyle: CustomTextStyle.t2(AppColors.whiteAccentColor),
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
