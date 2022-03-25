import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({Key? key, required this.icon, required this.text})
      : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: AppColors.primaryColor,
              ),
              child: Icon(
                icon,
                size: 32,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
