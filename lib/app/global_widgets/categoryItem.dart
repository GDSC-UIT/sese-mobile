import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.content, required this.iconData})
      : super(key: key);
  final String content;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.mainHomeColor,
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
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.lightTextColor,
            ),
          )
        ],
      ),
    );
  }
}
