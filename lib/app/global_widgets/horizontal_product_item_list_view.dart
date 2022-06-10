import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/utils/utils.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/routes/app_routes.dart';
import 'package:timeago/timeago.dart' as timeago;

class HorizontalProductItemListView extends StatelessWidget {
  HorizontalProductItemListView({
    Key? key,
    required this.product,
    required this.isGiveAway,
  }) : super(key: key);

  var product;

  late String imageUrl = product["images"][0];
  late int price = product["price"];
  late String name = product["name"];
  late String userName = product["user"]["name"];
  late String userAvatar = product["user"]["avatar"];
  late String address = product["location"];
  late String timeUpload = getTime(product["createdAt"]);
  bool isGiveAway;

  String getTime(String time) {
    time = time.substring(0, 10) + " " + time.substring(11);
    DateTime dateTime = DateTime.parse(time);
    var timeAgo = DateTime.now().subtract(Duration(
        days: dateTime.day, hours: dateTime.hour, minutes: dateTime.minute));
    timeago.setLocaleMessages('en', timeago.ViMessages());
    return timeago.format(timeAgo, locale: 'us');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.homeDetailProduct, arguments: product);
        print("Duong dep trai: ${product["categoryParams"].toString()}");
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        padding: const EdgeInsets.all(5),
        width: 130,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.neutralGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            FadeInImage(
              height: 120,
              fit: BoxFit.fill,
              placeholder: const AssetImage('assets/images/post_waiting.png'),
              image: NetworkImage(
                (imageUrl != "khong co link")
                    ? imageUrl
                    : DataCenter.errorImage,
                scale: 0.3,
              ),
              imageErrorBuilder: (_, __, ___) {
                return Image.asset('assets/images/post_waiting.png');
              },
            ),
            const SizedBox(
              height: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.h6(Colors.black),
                ),
                const SizedBox(
                  height: 6,
                ),
                isGiveAway
                    ? Container()
                    : Column(
                        children: [
                          Text(
                            num.parse(price.toString()).money("đ"),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyle.h6(AppColors.primaryColor),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        image: DecorationImage(
                          image: NetworkImage(userAvatar),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: Text(
                        userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyle.t10(AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                IconText(Icons.access_time, timeUpload),
                const SizedBox(
                  height: 4,
                ),
                IconText(Icons.location_on_outlined, address),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget IconText(IconData icon, String text) {
  return Row(
    children: [
      Icon(
        icon,
        size: 16,
        color: AppColors.neutralGrey,
      ),
      const SizedBox(width: 7),
      Expanded(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyle.t10(AppColors.neutralGrey),
        ),
      ),
    ],
  );
}
