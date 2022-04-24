import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/utils/utils.dart';
import 'package:sese/app/core/values/app_colors.dart';

import '../core/values/assets.gen.dart';

class ProductItemListView extends StatelessWidget {
  ProductItemListView({
    Key? key,
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.userName,
    required this.userAvatar,
    required this.timeUpload,
    required this.address,
    required this.isGiveAway,
  }) : super(key: key);

  String imageUrl;
  int price;
  String name;
  String userName;
  String userAvatar;
  String timeUpload;
  String address;
  bool isGiveAway;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              placeholder: const AssetImage('assets/images/post_waiting.png'),
              image: NetworkImage(
                imageUrl,
              ),
              imageErrorBuilder: (_, __, ___) {
                return Image.asset('assets/images/post_waiting.png');
              }),
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
