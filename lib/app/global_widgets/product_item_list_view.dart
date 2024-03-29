import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/utils/utils.dart';
import 'package:sese/app/core/values/app_colors.dart';

class ProductItemListView extends StatelessWidget {
  const ProductItemListView({
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

  final String imageUrl;
  final int price;
  final String name;
  final String userName;
  final String userAvatar;
  final String timeUpload;
  final String address;
  final bool isGiveAway;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(5),
      width: 129,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.neutralGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 97,
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
              iconText(Icons.access_time, timeUpload),
              const SizedBox(
                height: 4,
              ),
              iconText(Icons.location_on_outlined, address),
            ],
          )
        ],
      ),
    );
  }
}

Widget iconText(IconData icon, String text) {
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
