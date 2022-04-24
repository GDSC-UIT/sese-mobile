import 'package:flutter/material.dart';
import 'package:sese/app/global_widgets/product_item_grid_view.dart';

import '../data/models/product_model.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({Key? key}) : super(key: key);
  final List<ProductModel> productData = [
    ProductModel(
        address: 'Hồ Chí Minh',
        imageUrl:
            'https://winchair.vn/wp-content/uploads/2019/10/Gh%E1%BA%BF-nh%E1%BB%B1a-Dori-m%C3%A0u-xanh-1.jpg',
        name: 'Ghế nhựa',
        price: 50000,
        timeUpload: 1,
        userName: "meow meow",
        type: 'Nội thất'),
    ProductModel(
        address: 'Hồ Chí Minh',
        imageUrl:
            'https://songlongplastic.net/wp-content/uploads/2020/02/B%C3%80N-VU%C3%94NG-SONG-LONG-CH%C3%82N-NH%E1%BB%B0A-CAO-2606-2-scaled.jpg',
        name: 'Bàn nhựa',
        price: 50000,
        timeUpload: 1,
        userName: "duong_dep_trai",
        type: 'Nội thất'),
    ProductModel(
        address: 'Hồ Chí Minh',
        imageUrl:
            'https://static.8cache.com/cover/eJwNzUcSokAAAMAXUcuQZjjsQXISSSLDhSIoGYkSXr_bH-iuov88ZHG1W6knA0oedRI3_E3cpaNtBl014PCw1OPTG9WWX9SM4sk6PFGic4ZhSRJ4dy4OolkT_Cey0LfebG4vgPj5yl4ONlEt29nJA2NRIRa2dX3xZlwcw8IX_hQ4CK2Ft6719j_2Hgtyo6xLPz-Dd4m6qOsKgNIsgacqb95-1ZH6-UIqnDrWjc97Cump3y7YBzvnh6FE-oz5QEgTx8AtBSejezIt0js3P8WgAF0NYDQ5bpxtdD2KCTFYK6asq2pOfXUd5VYs5WSC7oj2rJEjj23K4yWsw5YQNRlCaWDK1TKsGfLJr7V8vCWYdZf1qhuOFfQL3sfg2s_zpI1cZ0o5dfeOHJv03b68dJ4avw8p4mIxZVBs6jznvW2APVVmx3F4WH33kNEMtVUyw8LRq6E76QxuQg312idomAlul9iEmEjSDfO7VqIjHOHcZvtaYEgrlMqMcjJmsEluSvFGFxAGvFTxpHWaxUbC4SaLHf60SW7Rp_i4Tg3GjYSm_aOPJorMXt7vTC97TQPQbOJT1ggaLxwwYkK9fYzHSr1r497kQvlFrQq3XRo7EYrdjFNheClMO_QTCLxu1o7UdtX8zb9jnVJeVHSlOKWeJdezZmOdMkIufF2KVJX7bS3ufagHXy9EkaBPt8H5mujMl3PPKF5xnleAqXfCcK5ydAbwuIEHlYj_LuQ_BJXnJQ==/cha-giau-cha-ngheo.jpg',
        name: 'Sách cha giàu cha nghèo',
        price: 100000,
        timeUpload: 1,
        userName: "duong_dep_trai",
        type: 'Đồ dùng học tập'),
    ProductModel(
        address: 'Hồ Chí Minh',
        imageUrl:
            'https://winchair.vn/wp-content/uploads/2019/10/Gh%E1%BA%BF-nh%E1%BB%B1a-Dori-m%C3%A0u-xanh-1.jpg',
        name: 'Ghế nhựa',
        price: 50000,
        timeUpload: 1,
        userName: "meow meow",
        type: 'Nội thất'),
    ProductModel(
        address: 'Hồ Chí Minh',
        imageUrl:
            'https://songlongplastic.net/wp-content/uploads/2020/02/B%C3%80N-VU%C3%94NG-SONG-LONG-CH%C3%82N-NH%E1%BB%B0A-CAO-2606-2-scaled.jpg',
        name: 'Bàn nhựa',
        price: 50000,
        timeUpload: 1,
        userName: "duong_dep_trai",
        type: 'Nội thất'),
    ProductModel(
        address: 'Hồ Chí Minh',
        imageUrl:
            'https://static.8cache.com/cover/eJwNzUcSokAAAMAXUcuQZjjsQXISSSLDhSIoGYkSXr_bH-iuov88ZHG1W6knA0oedRI3_E3cpaNtBl014PCw1OPTG9WWX9SM4sk6PFGic4ZhSRJ4dy4OolkT_Cey0LfebG4vgPj5yl4ONlEt29nJA2NRIRa2dX3xZlwcw8IX_hQ4CK2Ft6719j_2Hgtyo6xLPz-Dd4m6qOsKgNIsgacqb95-1ZH6-UIqnDrWjc97Cump3y7YBzvnh6FE-oz5QEgTx8AtBSejezIt0js3P8WgAF0NYDQ5bpxtdD2KCTFYK6asq2pOfXUd5VYs5WSC7oj2rJEjj23K4yWsw5YQNRlCaWDK1TKsGfLJr7V8vCWYdZf1qhuOFfQL3sfg2s_zpI1cZ0o5dfeOHJv03b68dJ4avw8p4mIxZVBs6jznvW2APVVmx3F4WH33kNEMtVUyw8LRq6E76QxuQg312idomAlul9iEmEjSDfO7VqIjHOHcZvtaYEgrlMqMcjJmsEluSvFGFxAGvFTxpHWaxUbC4SaLHf60SW7Rp_i4Tg3GjYSm_aOPJorMXt7vTC97TQPQbOJT1ggaLxwwYkK9fYzHSr1r497kQvlFrQq3XRo7EYrdjFNheClMO_QTCLxu1o7UdtX8zb9jnVJeVHSlOKWeJdezZmOdMkIufF2KVJX7bS3ufagHXy9EkaBPt8H5mujMl3PPKF5xnleAqXfCcK5ydAbwuIEHlYj_LuQ_BJXnJQ==/cha-giau-cha-ngheo.jpg',
        name: 'Sách cha giàu cha nghèo',
        price: 100000,
        timeUpload: 1,
        userName: "duong_dep_trai",
        type: 'Đồ dùng học tập'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.67,
      ),
      itemBuilder: (context, index) {
        ProductModel product = productData[index];
        return ProductItemGridView(
          address: product.address!,
          imageUrl: product.imageUrl!,
          name: product.name!,
          userName: product.userName!,
          timeUpload: product.timeUpload!,
          type: product.type!,
        );
      },
    );
  }
}
