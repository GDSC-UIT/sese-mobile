import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class InfoProductPropertyButton extends StatelessWidget {
  const InfoProductPropertyButton(
      {Key? key, required this.leading, required this.title, this.trailing})
      : super(key: key);
  final Widget leading;
  final Widget title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: AppColors.greenColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              leading,
              const SizedBox(
                width: 12,
              ),
              title
            ],
          ),
          trailing ?? const SizedBox()
        ],
      ),
    );
  }
}
