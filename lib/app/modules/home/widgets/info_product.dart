import 'package:flutter/material.dart';
import 'package:sese/app/core/values/assets.gen.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';

class InfoProduct extends StatelessWidget {
  const InfoProduct({Key? key, this.product}) : super(key: key);
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    String time = product["createdAt"];
    time = time.substring(0, 10) + " " + time.substring(11);
    DateTime dateTime = DateTime.parse(time);
    var _postTime = DateTime.now().subtract(Duration(
        days: dateTime.day, hours: dateTime.hour, minutes: dateTime.minute));
    timeago.setLocaleMessages('en', timeago.ViMessages());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          TextIcon(Icons.access_time, timeago.format(_postTime, locale: "vi"),
              3, CustomTextStyle.t10(AppColors.neutralGrey)),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Icon(
                  Icons.list,
                  color: AppColors.neutralGrey,
                  size: 15,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "in",
                        style: CustomTextStyle.t10(AppColors.neutralGrey),
                      ),
                      TextSpan(
                        text: " " +
                            (DataCenter.appSubCategory[product['category']]!
                                        .name.length >
                                    8
                                ? DataCenter
                                        .appSubCategory[product['category']]!
                                        .name
                                        .substring(0, 8) +
                                    "..."
                                : DataCenter
                                    .appSubCategory[product['category']]!.name),
                        style: CustomTextStyle.t10(AppColors.backIcon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 5,
          ),
          TextIcon(Icons.location_on_outlined, product["location"], 3,
              CustomTextStyle.t10(AppColors.neutralGrey)),
        ],
      ),
    );
  }
}

Widget TextIcon(IconData icon, String text, int flex, TextStyle textStyle) {
  return Expanded(
    flex: flex,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: AppColors.neutralGrey,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle,
          ),
        ),
      ],
    ),
  );
}
