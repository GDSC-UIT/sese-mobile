import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/utils/utils.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/routes/app_routes.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductInfo extends StatelessWidget {
  ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    String time = product["createdAt"];
    time = time.substring(0, 10) + " " + time.substring(11);
    DateTime dateTime = DateTime.parse(time);
    var _postTime = DateTime.now().subtract(Duration(
        days: dateTime.day, hours: dateTime.hour, minutes: dateTime.minute));
    timeago.setLocaleMessages('en', timeago.ViMessages());
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.homeDetailProduct, arguments: product);
      },
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product['images'][0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product["name"],
                      style: CustomTextStyle.t4(
                        AppColors.darkGreyColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //price
                    Text(
                      num.parse(product["price"].toString()).money("đ"),
                      style: CustomTextStyle.t3(AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12.0,
                          backgroundImage:
                              NetworkImage(product['user']['avatar']),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          product['user']['name'],
                          style: CustomTextStyle.t10(AppColors.primaryColor),
                        ),
                      ],
                    ),

                    //info product
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                color: AppColors.neutralGrey,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                timeago.format(_postTime, locale: 'us'),
                                style:
                                    CustomTextStyle.t10(AppColors.neutralGrey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.place,
                                color: AppColors.neutralGrey,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                product['location'].length > 16
                                    ? product['location'].substring(0, 16) +
                                        '...'
                                    : product['location'],
                                style:
                                    CustomTextStyle.t10(AppColors.neutralGrey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
