import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    Key? key,
  }) : super(key: key);

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
            Icons.shopping_cart,
            size: 35,
            color: Colors.white,
          ),
          Positioned(
            top: -5,
            left: -5,
            child: Container(
              width: 20,
              height: 20,
              child: const Center(
                child: Text(
                  '12',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.mainHomeColor,
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
