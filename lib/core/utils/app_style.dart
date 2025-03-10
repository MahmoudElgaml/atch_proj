import 'package:flutter/material.dart';

import 'app_color.dart';

class AppStyle {
  static TextStyle style34(BuildContext context) {
    return TextStyle(
      fontFamily: "AbhayaLibre",
      color: AppColor.authColor,
      fontSize: responsiveFont(fontSize: 34, context: context),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style13(BuildContext context) {
    return TextStyle(
      fontFamily: "AbhayaLibre",
      color: Colors.white,
      fontSize: responsiveFont(fontSize: 13, context: context),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style26(BuildContext context) {
    return TextStyle(
      fontFamily: "AbhayaLibre",
      color: Colors.black,
      fontSize: responsiveFont(fontSize: 26, context: context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style18(BuildContext context) {
    return TextStyle(
      fontFamily: "AbhayaLibre",
      color: Colors.black,
      fontSize: responsiveFont(fontSize: 18, context: context),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle style18ExtraBold(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontFamily: "AbhayaLibre",
      fontSize: responsiveFont(fontSize: 18, context: context),
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle style14ExtraBold(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontFamily: "AbhayaLibre",
      fontSize: responsiveFont(fontSize: 14, context: context),
      fontWeight: FontWeight.w900,
    );
  }
  static TextStyle style14Regular(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontFamily: "AbhayaLibre",
      fontSize: responsiveFont(fontSize: 14, context: context),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style18Regular(BuildContext context) {
    return TextStyle(
      color: const Color(0xff5669FF),
      fontFamily: "AbhayaLibre",
      fontSize: responsiveFont(fontSize: 18, context: context),
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle style16Regular(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontFamily: "AbhayaLibre",
      fontSize: responsiveFont(fontSize: 16, context: context),
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle style16Bold(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontFamily: "AbhayaLibre",
      fontSize: responsiveFont(fontSize: 16, context: context),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle style24Regular(BuildContext context) {
    return TextStyle(
      color: Colors.black,
      fontFamily: "AbhayaLibre",
      fontSize: responsiveFont(fontSize: 24, context: context),
      fontWeight: FontWeight.w400,
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
