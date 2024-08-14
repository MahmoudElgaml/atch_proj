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
        hintText: hintText,
        suffixIcon: icon,
        enabledBorder: Helper.buildOutlineInputBorder(),
        disabledBorder: Helper.buildOutlineInputBorder(),
        border: Helper.buildOutlineInputBorder(),
      ),
    );
  }
}
