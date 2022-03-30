import 'package:flutter/material.dart';
import 'package:sese/app/modules/user_profile/widgets/product_card.dart';

class ListingWidget extends StatelessWidget {
  const ListingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard();
        });
  }
}
