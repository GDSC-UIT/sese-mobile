import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sese/app/data/models/product_model.dart';
import 'package:sese/app/global_widgets/product_item_list_view.dart';
import 'package:duration/duration.dart';
import 'package:timeago/timeago.dart' as timeago;

class HorizontalProductListView extends StatelessWidget {
  HorizontalProductListView(
      {Key? key,
      required this.scrollController,
      required this.listProduct,
      required this.isGiveAway})
      : super(key: key);
  final ScrollController scrollController;
  final listProduct;
  final bool isGiveAway;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var product = listProduct[index];
          String time = product["createdAt"];
          time = time.substring(0, 10) + " " + time.substring(11);
          DateTime dateTime = DateTime.parse(time);
          var timeAgo = DateTime.now().subtract(Duration(
              days: dateTime.day,
              hours: dateTime.hour,
              minutes: dateTime.minute));
          timeago.setLocaleMessages('en', timeago.ViMessages());

          return ProductItemListView(
            address: product["location"],
            imageUrl: product["images"][0],
            price: product["price"],
            name: product["name"],
            userName: product["user"]["name"],
            userAvatar: product["user"]["avatar"],
            timeUpload: timeago.format(timeAgo, locale: 'us'),
            isGiveAway: isGiveAway,
          );
        },
        itemCount: listProduct.length,
      ),
    );
  }
}
