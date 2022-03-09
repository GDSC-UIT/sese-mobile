import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final String text;
  final Color textColor;
  Color? borderColor;
  Color? backgroundColor;
  Widget? icon;
  final Function onPress;
  AppButton({
    Key? key,
    required this.onPress,
    required this.text,
    required this.textColor,
    this.backgroundColor,
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          border: Border.all(
            color: borderColor ?? Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.max,
          children: [
            icon ?? Container(),
            icon != null
                ? const SizedBox(
                    width: 32,
                  )
                : Container(),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
