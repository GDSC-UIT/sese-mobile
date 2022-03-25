import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sese/app/core/values/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.content, required this.iconData})
      : super(key: key);
  final String content;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
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
