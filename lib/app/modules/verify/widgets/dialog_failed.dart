import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/values/app_colors.dart';

class DialogFailed extends StatelessWidget {
  const DialogFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      backgroundColor: AppColors.lightOrange,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              border: Border.all(
                width: 1,
                color: AppColors.primaryColor,
              ),
            ),
            child: const Icon(
              Icons.close,
              size: 20,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            width: 29,
          ),
          Text(
            "Chụp thất bại!",
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
