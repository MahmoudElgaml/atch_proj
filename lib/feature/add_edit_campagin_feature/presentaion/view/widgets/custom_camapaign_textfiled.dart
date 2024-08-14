import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:flutter/material.dart';

class CustomCampaignTextFiled extends StatelessWidget {
  const CustomCampaignTextFiled(
      {super.key,
      this.icon,
      required this.hint,
      required this.maxLine,
      required this.labelText});

  final String hint;
  final String labelText;
  final Icon? icon;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: Helper.buildOutlineInputBorder(),
          enabledBorder: Helper.buildOutlineInputBorder(),
          disabledBorder: Helper.buildOutlineInputBorder(),
          labelText: labelText,
          labelStyle: AppStyle.style18(context).copyWith(
            color: const Color(0xff747688),
          ),
          hintText: hint,
          hintStyle: AppStyle.style14Regular(context).copyWith(
            color: const Color(0xff747688),
          ),
          prefixIcon: icon),
      maxLines: maxLine,
    );
  }
}
