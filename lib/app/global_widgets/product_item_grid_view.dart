import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

import '../core/values/assets.gen.dart';

class ProductItemGridView extends StatelessWidget {
  ProductItemGridView({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.userName,
    required this.timeUpload,
    required this.type,
    required this.address,
  }) : super(key: key);

  String imageUrl;
  String name;
  String userName;
  String type;
  int timeUpload;
  String address;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.neutralGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
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
                style: CustomTextStyle.t8(Colors.black),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      image: const DecorationImage(
                        image: Assets.imagesAvatar,
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
              IconText(Icons.access_time, "$timeUpload trước"),
              const SizedBox(
                height: 4,
              ),
              IconText(Icons.list, type),
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
      Flexible(
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
