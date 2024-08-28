import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CheckkBox extends StatefulWidget {
  const CheckkBox({super.key, required this.setValue});

  final void Function(bool? valuee) setValue;

  @override
  State<CheckkBox> createState() => _CheckkBoxState();
}

bool selectedValue = false;

class _CheckkBoxState extends State<CheckkBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: selectedValue,
          onChanged: (value) {
            selectedValue = value ?? false;
            widget.setValue(value);
            setState(() {});
          },
        ),
        Text(
          "Generate ReferralCode?",
          style:
              AppStyle.style18(context).copyWith(color: AppColor.primaryColor),
        )
      ],
    );
  }
}
