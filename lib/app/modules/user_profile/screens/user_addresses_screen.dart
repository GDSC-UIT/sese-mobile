import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/user_profile/widgets/address_card.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({Key? key}) : super(key: key);

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
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              AddressCard(
                defaultButton: true,
                name: "Nguyễn Meow Meow",
                phoneNumber: "0123323435",
                address:
                    "Kí túc xá khu A, khu phố 6, HCM aaaaaaaaaaaaaaaaaaaaa",
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                    onTap: () {},
                    child: Container(
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
                      child: Center(
                          child: Text(
                        "+ Add Address",
                        style: CustomTextStyle.t4(AppColors.darkGreyColor),
                      )),
                    )),
              )
            ],
          ),
        ));
  }
}
