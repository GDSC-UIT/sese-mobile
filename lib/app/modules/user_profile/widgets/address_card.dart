import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/user_profile/widgets/default_button.dart';
import 'package:sese/app/routes/app_routes.dart';

class AddressCard extends StatelessWidget {
  final String name, phoneNumber, address;
  final bool defaultButton;
  final Function onPressed;
  AddressCard({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.defaultButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: CustomTextStyle.t3(AppColors.darkGreyColor),
                    ),
                    defaultButton ? const DefaultButton() : Container(),
                  ],
                ),
                Text(
                  phoneNumber,
                  style: CustomTextStyle.t4(AppColors.lightGreyColor),
                ),
                Container(
                  width: 250,
                  child: Text(
                    address,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyle.t4(AppColors.lightGreyColor),
                  ),
                ),
              ]),
          SizedBox(
            width: 40,
            height: 80,
            child: TextButton(
                onPressed: () {
                  onPressed(); 
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.backIcon,
                )),
          )
        ],
      ),
    );
  }
}
