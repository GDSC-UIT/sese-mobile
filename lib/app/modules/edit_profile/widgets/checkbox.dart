import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/edit_profile/edit_profile_controller.dart';

class GenderCheckBox extends StatefulWidget {
  GenderCheckBox({Key? key, required this.gender}) : super(key: key);
  final String gender;
  EditProfileController editProfileController = Get.find();
  @override
  State<GenderCheckBox> createState() => _GenderCheckBoxState();
}

class _GenderCheckBoxState extends State<GenderCheckBox> {
  late final String text;
  bool value = false; 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            widget.gender,
            style: CustomTextStyle.t6(AppColors.darkGreyColor),
          ),
          InkWell(
            onTap: () {
              setState(() {
                value = !value;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: value
                  ? const Center(
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.white,
                      ),
                    )
                  : const Center(
                      child: Icon(
                        Icons.circle,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
            ),
          )
        ]),
      ),
    );
  }
}
