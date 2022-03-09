import 'package:flutter/material.dart';

class AppProductCard extends StatelessWidget {
  AppProductCard({
    Key? key,
    required this.address,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.timeUpload,
    required this.type,
  }) : super(key: key);

  String imageUrl;
  String name;
  String type;
  double price;
  int timeUpload;
  String address;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Image.network(imageUrl),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.lock_clock_outlined),
                    const SizedBox(
                      width: 8,
                    ),
                    Text('$timeUpload giờ trước')
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.format_list_bulleted,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(type)
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.payments,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(price.toString())
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.place,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(address)
              ],
            ),
          )
        ],
      ),
    );
  }
}
