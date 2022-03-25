import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      //controller: controller,
      style: TextStyle(
        fontSize: 20.0,
        color: Color.fromARGB(255, 65, 67, 70),
      ),
      decoration: InputDecoration(
        //hintText: 'Search product here...',
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(24.0))),
        // hintText: 'Search',
        hintStyle: TextStyle(
          color: AppColors.lightGreyColor,
          fontSize: 20,
        ),
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.camera_alt_outlined),
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
