/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  /// File path: assets/images/Calendar_icon.png
  static const AssetGenImage imagesCalendarIcon = AssetGenImage('assets/images/Calendar_icon.png');

  /// File path: assets/images/avatar.png
  static const AssetGenImage imagesAvatar = AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/do_dien_tu.png
  static const AssetGenImage imagesDoDienTu = AssetGenImage('assets/images/do_dien_tu.png');

  /// File path: assets/images/do_gia_dung.png
  static const AssetGenImage imagesDoGiaDung = AssetGenImage('assets/images/do_gia_dung.png');

  /// File path: assets/images/facebook_icon.png
  static const AssetGenImage imagesFacebookIcon = AssetGenImage('assets/images/facebook_icon.png');

  /// File path: assets/images/giai_tri.png
  static const AssetGenImage imagesGiaiTri = AssetGenImage('assets/images/giai_tri.png');

  /// File path: assets/images/google_icon.png
  static const AssetGenImage imagesGoogleIcon = AssetGenImage('assets/images/google_icon.png');

  /// File path: assets/images/lam_dep.png
  static const AssetGenImage imagesLamDep = AssetGenImage('assets/images/lam_dep.png');

  /// File path: assets/images/login_begin_img.png
  static const AssetGenImage imagesLoginBeginImg = AssetGenImage('assets/images/login_begin_img.png');

  /// File path: assets/images/post_product_begin.png
  static const AssetGenImage imagesPostProductBegin = AssetGenImage('assets/images/post_product_begin.png');

  /// File path: assets/images/sach.png
  static const AssetGenImage imagesSach = AssetGenImage('assets/images/sach.png');

  /// File path: assets/images/sese.png
  static const AssetGenImage imagesSese = AssetGenImage('assets/images/sese.png');

  /// File path: assets/images/thoi_trang.png
  static const AssetGenImage imagesThoiTrang = AssetGenImage('assets/images/thoi_trang.png');
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
