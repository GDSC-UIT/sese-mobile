class SeseUser {
  //
  late String _name;
  late String _imageUrl;
  SeseUser({required name, required imageUrl}) {
    _name = name;
    _imageUrl = imageUrl;
  }

  String nameGetter() => _name;
  String imageUrlGetter() => _imageUrl;
}
