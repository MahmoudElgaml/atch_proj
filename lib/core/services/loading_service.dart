
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configureEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = const Color(0xffffffff)
    ..indicatorColor = AppColor.primaryColor
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = const Color(0x54ffffff)
    ..userInteractions = false
    ..dismissOnTap = false;
}
