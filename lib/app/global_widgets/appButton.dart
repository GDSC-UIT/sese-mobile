import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPress;
  AppButton(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPress();
      },
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
