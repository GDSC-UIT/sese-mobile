import 'package:flutter/material.dart';
import 'package:sese/app/core/themes/app_theme.dart';
import 'package:sese/app/core/values/app_colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: controller,

      style: CustomTextStyle.t6(AppColors.neutralGrey),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 8),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        hintText: 'Search product',
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
