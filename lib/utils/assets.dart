import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class Assets {
  Assets._();
  static const close = 'assets/icons/Close.svg';
  static const search = 'assets/icons/Search.svg';
  static const ban = 'assets/icons/Ban.svg';
  static const favActive = 'assets/icons/Favorite_active.svg';
  static const favDefault = 'assets/icons/Favorite_default.svg';
  static const left = 'assets/icons/left.svg';

}

extension AssetsHelper on String {
  SvgPicture svg({
    Color? color,
    double? height,
    double? width,
    BoxFit fit = BoxFit.scaleDown,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter: ColorFilter.mode(color ?? AppColors.pureWhite, BlendMode.srcIn),
      height: height,
      width: width,
      fit: fit,
    );
  }

  Image get png => Image.asset(this);

  SvgPicture dynamicColoredSvg({
    bool invertColor = false,
    colorFilter = const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
    double? height,
    double? width,
    BoxFit fit = BoxFit.scaleDown,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter: colorFilter,
      height: height,
      width: width,
      fit: fit,
    );
  }
}