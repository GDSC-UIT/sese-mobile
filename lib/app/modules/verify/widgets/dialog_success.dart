import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/values/app_colors.dart';

class DialogSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(
          color: AppColors.backIcon,
          width: 1,
        ),
      ),
      backgroundColor: AppColors.lightGreenColor,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              border: Border.all(
                width: 1,
                color: AppColors.backIcon,
              ),
              color: AppColors.boldGreenColor,
            ),
            child: const Icon(
              Icons.check,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 29,
          ),
          Text(
            "Chụp thành công!",
            style: GoogleFonts.robotoMono(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
