import 'package:flutter/material.dart';

import 'app_color.dart';

class AppStyle {
  static TextStyle style34(BuildContext context) {
    return TextStyle(
      color: AppColor.authColor,
      fontSize: responsiveFont(fontSize: 34, context: context),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleRegularOpacity = TextStyle(
    color: Colors.black.withOpacity(.3),
    fontWeight: FontWeight.bold,
  );
  static TextStyle styleWhite = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17);

  static double scaleFactor(double width) {
    if (width < 500) {
      return width / 400;
    } else if (width > 900) {
      return width / 1000;
    } else {
      return width / 700;
    }
  }

  static double responsiveFont(
      {required double fontSize, required BuildContext context}) {
    double width = MediaQuery.sizeOf(context).width;
    double scalefactor = scaleFactor(width);
    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;

    double responsiveFont = fontSize * scalefactor;
    return responsiveFont.clamp(lowerLimit, upperLimit);
  }
}
