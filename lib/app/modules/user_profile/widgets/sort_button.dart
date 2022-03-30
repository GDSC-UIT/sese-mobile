import 'package:flutter/material.dart';
import 'package:sese/app/core/values/app_colors.dart';

// ignore: must_be_immutable
class SortButton extends StatelessWidget {
  final String text;
  //final Color textColor;
  final TextStyle? textStyle;
  Color? borderColor;
  double? borderThickness;
  Color? backgroundColor;
  Widget? icon;
  final Function onPress;
  SortButton({
    Key? key,
    required this.onPress,
    required this.text,
    //required this.textColor,
    this.textStyle,
    this.backgroundColor,
    this.borderThickness,
    this.borderColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        onPress(),
      },
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          border: Border.all(
            color: borderColor ?? Colors.white,
            width: borderThickness ?? 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            icon ??
                InkWell(
                  child: const Icon(
                    Icons.cancel_rounded,
                    color: Colors.white38,
                  ),
                  onTap: () {},
                ),
          ],
        ),
      ),
    );
  }
}
