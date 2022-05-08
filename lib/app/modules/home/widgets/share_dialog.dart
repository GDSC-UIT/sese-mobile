import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/values/assets.gen.dart';

class ShareDialog extends StatelessWidget {
  const ShareDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(
          color: AppColors.backIcon,
          width: 1,
        ),
      ),
      backgroundColor: Colors.white,
      title: SizedBox(
        height: 240,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chia sẻ",
                  style: CustomTextStyle.t1(AppColors.darkGreyColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    color: AppColors.darkGreyColor,
                    size: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundedIconButton(Assets.iconsFacebook, "Facebook"),
                RoundedIconButton(Assets.iconsMessenger, "Messenger"),
                RoundedIconButton(Assets.iconsInstagram, "Instagram"),
                RoundedIconButton(Assets.iconsTwitter, "Twitter"),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Page Link",
              style: CustomTextStyle.t6(AppColors.darkGreyColor),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 48,
              width: 291,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.backIcon),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        "https://sese.app/product/Nike_Airforce/alo alo alo",
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.t6(AppColors.neutralGrey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.content_copy,
                        size: 20,
                        color: AppColors.backIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget RoundedIconButton(AssetGenImage assetGenImage, String text) {
  return Column(
    children: [
      Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: AppColors.cloadDarkColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image(
            image: assetGenImage,
            color: AppColors.mainHomeColor,
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        text,
        style: CustomTextStyle.t6(AppColors.darkGreyColor),
      ),
    ],
  );
}
