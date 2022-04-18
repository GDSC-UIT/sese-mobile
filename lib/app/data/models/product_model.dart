class ProductModel {
  String? imageUrl;
  String? name;
  String? userName;
  String? type;
  double? price;
  int? timeUpload;
  String? address;
  String? note;
  int? quantity;
  String? location;
  String? category;
  String? categoryParams;

  ProductModel(
      {this.address,
      this.imageUrl,
      this.name,
      this.userName,
      this.price,
      this.timeUpload,
      this.type,
      this.note,
      this.quantity});
}
