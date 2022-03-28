import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({
    Key? key,
    required this.content,
  }) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(2, 2),
              color: AppColors.lightGreyColor,
            ),
          ]),
      child: Text(
        content,
        style: const TextStyle(
          color: AppColors.textHomeColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
