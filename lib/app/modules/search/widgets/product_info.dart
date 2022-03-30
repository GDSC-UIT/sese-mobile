import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({
    Key? key,
    required this.productImgUrl,
    required this.nameProduct,
    required this.userImgUrl,
    required this.nameUser,
    required this.location,
  }) : super(key: key);
  String productImgUrl;
  String userImgUrl;
  String nameProduct;
  String nameUser;

  String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            // child: Image.network(productImgUrl),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                productImgUrl,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameProduct,
                    style: CustomTextStyle.t4(
                      AppColors.darkGreyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //price
                  Text(
                    '10000đ',
                    style: CustomTextStyle.t3(AppColors.primaryColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16.0,
                        backgroundImage: NetworkImage(userImgUrl),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        nameUser,
                        style: CustomTextStyle.t10(AppColors.primaryColor),
                      ),
                    ],
                  ),

                  //info product
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
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
                              '1 giờ trước',
                              style: CustomTextStyle.t10(AppColors.neutralGrey),
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
                              location,
                              style: CustomTextStyle.t10(AppColors.neutralGrey),
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
    );
  }
}
