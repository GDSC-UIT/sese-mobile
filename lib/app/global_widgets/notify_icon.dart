import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class NotifyIcon extends StatelessWidget {
  NotifyIcon(this.notifi, {Key? key}) : super(key: key);
  final int notifi;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('go to carts screen');
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(
            Icons.notifications,
            size: 32,
            color: Colors.white,
          ),
          Positioned(
            top: -2,
            right: 0,
            child: Container(
              width: 16,
              height: 16,
              child: Center(
                child: Text(
                  notifi.toString(),
                  style: CustomTextStyle.link(Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
                border: Border.all(
                  width: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
