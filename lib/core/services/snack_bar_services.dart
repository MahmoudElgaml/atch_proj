import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes/routes.dart';
import '../utils/app_color.dart';
import '../utils/app_style.dart';

class SnackBarServices {
  static void showUnLoggedMessage(BuildContext context) {
    var snackBar = SnackBar(
      content: Text(
        "you Must Login First",
        style: AppStyle.style18ExtraBold(context).copyWith(color: Colors.white),
      ),
      padding: const EdgeInsets.all(15),
      duration: const Duration(seconds: 4),
      backgroundColor: AppColor.primaryColor,
      action: SnackBarAction(
        textColor: Colors.black,
        label: "Login",
        onPressed: () {
          context.go(AppRoute.logInKey);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
