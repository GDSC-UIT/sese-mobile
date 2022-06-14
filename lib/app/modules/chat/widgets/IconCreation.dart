import 'package:flutter/material.dart';

class IconCreation extends StatelessWidget {
  const IconCreation({
    Key? key,
    required this.color,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
        Text(title)
      ],
    );
  }
}
