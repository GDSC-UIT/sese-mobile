import 'package:flutter/material.dart';
import 'package:sese/app/modules/home/widgets/star_vote.dart';

import '../../../core/themes/app_theme.dart';
import '../../../core/values/app_colors.dart';

class UserEvaluate extends StatelessWidget {
  const UserEvaluate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Review user",
                  style: CustomTextStyle.h4(Colors.black),
                ),
                Row(
                  children: [
                    StarVote(star: 3),
                    const SizedBox(
                      width: 17,
                    ),
                    Row(
                      children: [
                        Text(
                          "4/5",
                          style: CustomTextStyle.t6(AppColors.primaryColor),
                        ),
                        Text(
                          "(1 review(s))",
                          style: CustomTextStyle.t6(AppColors.neutralGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "View all >",
              style: CustomTextStyle.t8(AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
