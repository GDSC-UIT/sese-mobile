import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sese/app/core/values/app_colors.dart';
import 'package:sese/app/modules/home/home_controller.dart';
import 'package:sese/app/routes/app_routes.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {Key? key,
      required this.content,
      required this.iconData,
      required this.homeController})
      : super(key: key);
  final String content;
  final IconData iconData;
  final HomeController homeController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              homeController.typeScreen = content;
              Get.toNamed(AppRoutes.homeCategory);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 3),
                      color: AppColors.lightGreyColor,
                      blurRadius: 2,
                    ),
                  ]),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            content,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 9,
              color: AppColors.textHomeColor,
            ),
          )
        ],
      ),
    );
  }
}
