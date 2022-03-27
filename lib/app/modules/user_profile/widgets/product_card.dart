import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            height: 300,
            width: 180,
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppColors.lightGreyColor,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                SizedBox(
                  height: 140,
                  child: Image.network(
                      'https://s3-alpha-sig.figma.com/img/4c65/ed6f/a2f0d6d42ac1e9c0de3bcc99b607416c?Expires=1649030400&Signature=LhAKC-3HQAsTvH1QQKRaR8WWVv6dOUoE0FtLyTcc1XrqKHmQyZBTUTNJYSDS1fwV6PgI5aEmh5rZby6XIj3v1GcItlKypRn0hitsRLfRTUNo-xlxCt5sbGLLtsk6-DKwFaabE4FCRbCQti7MYJPlb53XQRHyubDJuEfjoxgMH~FB3U3KiLZdgQGU5Tg8gOQTFPznb1DO-GVmVCneYkqF70JSHSXnYBYf~zgS6GAPIM8rJISoKPdufPiaRa90NvejDD5wDxbCFsLuxAx4Zm-i6Ww4uMvndp4KrTBTa1jQ2wshliHnBpWagqdglrA1MB8XkuEk3WyhWhtZkMHpAWeAIw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                      width: MediaQuery.of(context).size.width / 2,
                      fit: BoxFit.cover),
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trà ô long(Hộp 2 cái)  ",
                          style: CustomTextStyle.t4(AppColors.darkGreyColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "meow meow",
                              style:
                                  CustomTextStyle.t10(AppColors.primaryColor),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: Icon(
                                Icons.access_alarm,
                                color: AppColors.neutralGrey,
                                size: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "1 ngày trước",
                              style: CustomTextStyle.t10(AppColors.neutralGrey),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: Icon(
                                Icons.menu_outlined,
                                color: AppColors.neutralGrey,
                                size: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Đồ ăn",
                              style: CustomTextStyle.t10(AppColors.neutralGrey),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: Icon(
                                Icons.location_on,
                                color: AppColors.neutralGrey,
                                size: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "TP.Hồ Chí Minh",
                              style: CustomTextStyle.t10(AppColors.neutralGrey),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            )));
  }
}
