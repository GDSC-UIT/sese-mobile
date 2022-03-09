class ProductModel {
  String imageUrl;
  String name;
  String type;
  double price;
  int timeUpload;
  String address;

  ProductModel({
    required this.address,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.timeUpload,
    required this.type,
  });
}
