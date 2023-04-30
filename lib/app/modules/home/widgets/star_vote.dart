import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class StarVote extends StatelessWidget {
  const StarVote({Key? key, required this.star}) : super(key: key);
  final int star;

  @override
  Widget build(BuildContext context) {
    switch (star) {
      case 0:
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
          ],
        );
      case 1:
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
          ],
        );

      case 2:
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
          ],
        );

      case 3:
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
          ],
        );

      case 4:
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 20,
            ),
          ],
        );

      case 5:
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 20,
            ),
          ],
        );
      default:
        return Row(
          children: const [
            Icon(
              Icons.star,
              color: AppColors.lightGreyColor,
              size: 15,
            ),
          ],
        );
    }
  }
}
