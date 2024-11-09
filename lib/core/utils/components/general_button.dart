import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton(
      {super.key, required this.onPressed, required this.title});

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: AppColor.yellowColor,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          title,
          style: AppStyle.style24BoldDarkBlue(context),
        ),
      ),
    );
  }
}
