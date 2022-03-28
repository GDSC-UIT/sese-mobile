import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class CameraButton extends StatelessWidget {
  CameraButton(this.function);
  final Function function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        function(),
      },
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
          color: AppColors.lightOrange,
        ),
        child: const Center(
          child: Icon(
            Icons.camera_alt,
            size: 35,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
