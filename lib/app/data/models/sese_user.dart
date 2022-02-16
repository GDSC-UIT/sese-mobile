class SeseUser {
  //
  late String _name;
  late String _imageUrl;
  SeseUser({required name, required imageUrl}) {
    this._name = name;
    this._imageUrl = imageUrl;
  }

  String nameGetter() => _name;
  String imageUrlGetter() => _imageUrl;
}
