import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:flutter/material.dart';

class CustomDateTimeTextFiled extends StatelessWidget {
  const CustomDateTimeTextFiled({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onTap,
    this.icon,
    this.onChanged,
    this.formKey,
  });

  final String hintText;
  final void Function(String)? onChanged;
  final int maxLines;
  final Icon? icon;
  final void Function()? onTap;

  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: onTap,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10),
        hintStyle: AppStyle.style21Regular(context),
        hintText: hintText,
        suffixIcon: icon,
        enabledBorder: Helper.buildOutlineInputBorder(),
        disabledBorder: Helper.buildOutlineInputBorder(),
        focusedBorder: Helper.buildOutlineInputBorder(),
        border: Helper.buildOutlineInputBorder(),
      ),
    );
  }
}
