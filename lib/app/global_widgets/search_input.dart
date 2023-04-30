import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key, required this.color, required this.hintText})
      : super(key: key);
  final Color color;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: controller,
      enabled: false,
      style: CustomTextStyle.t6(AppColors.neutralGrey),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 8),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        hintText: hintText,
        hintStyle: CustomTextStyle.t6(AppColors.neutralGrey),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.backIcon,
        ),
        // labelStyle: TextStyle(
        //   fontSize: 20,
        // ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
