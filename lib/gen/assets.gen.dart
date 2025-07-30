/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Usb.jpg
  AssetGenImage get usb => const AssetGenImage('assets/images/Usb.jpg');

  /// File path: assets/images/dakto.svg
  String get dakto => 'assets/images/dakto.svg';

  /// File path: assets/images/daktoIcon.svg
  String get daktoIcon => 'assets/images/daktoIcon.svg';

  /// File path: assets/images/danakBig.png
  AssetGenImage get danakBig =>
      const AssetGenImage('assets/images/danakBig.png');

  /// File path: assets/images/danak_color.svg
  String get danakColor => 'assets/images/danak_color.svg';

  /// File path: assets/images/danak_white.svg
  String get danakWhite => 'assets/images/danak_white.svg';

  /// File path: assets/images/devIcon.svg
  String get devIcon => 'assets/images/devIcon.svg';

  /// File path: assets/images/developer.png
  AssetGenImage get developer =>
      const AssetGenImage('assets/images/developer.png');

  /// File path: assets/images/fact.svg
  String get fact => 'assets/images/fact.svg';

  /// File path: assets/images/fire.png
  AssetGenImage get fire => const AssetGenImage('assets/images/fire.png');

  /// File path: assets/images/github.svg
  String get github => 'assets/images/github.svg';

  /// File path: assets/images/instaIcon.svg
  String get instaIcon => 'assets/images/instaIcon.svg';

  /// File path: assets/images/life.svg
  String get life => 'assets/images/life.svg';

  /// File path: assets/images/life_reading.svg
  String get lifeReading => 'assets/images/life_reading.svg';

  /// File path: assets/images/memberIcon.svg
  String get memberIcon => 'assets/images/memberIcon.svg';

  /// File path: assets/images/menu.svg
  String get menu => 'assets/images/menu.svg';

  /// File path: assets/images/privacyIcon.svg
  String get privacyIcon => 'assets/images/privacyIcon.svg';

  /// File path: assets/images/rateIcon.svg
  String get rateIcon => 'assets/images/rateIcon.svg';

  /// File path: assets/images/shakhes.png
  AssetGenImage get shakhes => const AssetGenImage('assets/images/shakhes.png');

  /// File path: assets/images/telegramIcon.svg
  String get telegramIcon => 'assets/images/telegramIcon.svg';

  /// File path: assets/images/terms.svg
  String get terms => 'assets/images/terms.svg';

  /// File path: assets/images/theory.svg
  String get theory => 'assets/images/theory.svg';

  /// File path: assets/images/theory_Mountain.svg
  String get theoryMountain => 'assets/images/theory_Mountain.svg';

  /// File path: assets/images/working.svg
  String get working => 'assets/images/working.svg';

  /// List of all assets
  List<dynamic> get values => [
    usb,
    dakto,
    daktoIcon,
    danakBig,
    danakColor,
    danakWhite,
    devIcon,
    developer,
    fact,
    fire,
    github,
    instaIcon,
    life,
    lifeReading,
    memberIcon,
    menu,
    privacyIcon,
    rateIcon,
    shakhes,
    telegramIcon,
    terms,
    theory,
    theoryMountain,
    working,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
