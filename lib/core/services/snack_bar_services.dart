import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/routes.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class SnackBarServices {
  static void showSelectLocationMessage(BuildContext context) {
    var snackBar = SnackBar(
      content: Text(
        "location selected successfully",
        style: AppStyle.style18ExtraBold(context).copyWith(color: Colors.white),
      ),
      padding: const EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
      backgroundColor: AppColor.primaryColor,
    );
    print("showSelectLocationMessage");
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
