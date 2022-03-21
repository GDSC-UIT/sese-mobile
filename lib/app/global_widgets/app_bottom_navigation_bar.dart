import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  AppBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  //HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () =>
    // );
    return BottomNavigationBar(
      currentIndex: 0, //homeController.pageIdx.value,
      onTap: (index) {
        // homeController.changePage(index);
      },
      elevation: 0,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.lightGreyColor,
      items: [
        const BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home_filled,
            size: 30,
          ),
        ),
        const BottomNavigationBarItem(
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
        //BottomNavigationBarItem(label: '', icon: AppImageIcon()),
        BottomNavigationBarItem(
          label: '',
          icon: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        const BottomNavigationBarItem(
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
        const BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
        ),
      ],
    );
  }
}
