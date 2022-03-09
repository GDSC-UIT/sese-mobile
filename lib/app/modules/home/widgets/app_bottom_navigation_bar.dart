import 'package:get/get.dart';
import 'package:sese/app/global_widgets/image_Icon.dart';
import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/home/home_controller.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: homeController.pageIdx.value,
        onTap: (index) {
          homeController.changePage(index);
        },
        elevation: 0,
        backgroundColor: AppColors.mainHomeBackGroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainHomeColor,
        unselectedItemColor: AppColors.lightGreyColor,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home_filled,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.favorite_border,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(label: '', icon: AppImageIcon()),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.chat_bubble_outline,
              size: 30,
            ),
            activeIcon: Icon(
              Icons.chat_bubble,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
