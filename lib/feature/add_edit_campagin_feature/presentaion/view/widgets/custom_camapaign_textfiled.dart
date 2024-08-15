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
      required this.labelText,
      this.textEditingController});

  final String hint;
  final String labelText;
  final Icon? icon;
  final int maxLine;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
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
