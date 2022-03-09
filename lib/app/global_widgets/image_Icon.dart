import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class AppImageIcon extends StatelessWidget {
  const AppImageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.mainHomeColor,
      ),
      child: const Icon(
        Icons.photo_camera,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
