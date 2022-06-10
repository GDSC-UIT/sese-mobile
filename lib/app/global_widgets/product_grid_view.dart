import 'package:flutter/material.dart';
import 'package:sese/app/data/services/data_center.dart';
import 'package:sese/app/global_widgets/product_item_grid_view.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({Key? key, required this.productData}) : super(key: key);

  var productData;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        var product = productData[index];
        var tempType =
            DataCenter.appCategory[productData[index]['category']].toString();
        return ProductItemGridView(
          address: product["location"],
          imageUrl: product["images"][0],
          name: product["name"],
          userName: product["user"]["name"],
          // timeUpload: product["createdAt"],
          timeUpload: 10,
          type: tempType,
        );
      },
    );
  }
}
