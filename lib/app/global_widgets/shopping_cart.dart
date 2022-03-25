import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart(this.notifi, {Key? key}) : super(key: key);
  final notifi;

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
            Icons.notifications_none_rounded,
            size: 35,
            color: Colors.white,
          ),
          Positioned(
            top: -5,
            left: -5,
            child: Container(
              width: 20,
              height: 20,
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
