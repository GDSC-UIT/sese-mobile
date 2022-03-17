import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class VerifyFrontSvScreen extends StatefulWidget {
  const VerifyFrontSvScreen({Key? key}) : super(key: key);

  @override
  State<VerifyFrontSvScreen> createState() => _VerifyFrontSvScreenState();
}

class _VerifyFrontSvScreenState extends State<VerifyFrontSvScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.backIcon,
            size: 30,
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
