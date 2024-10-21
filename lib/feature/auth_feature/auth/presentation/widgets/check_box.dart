import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/coatume_auth_button.dart';
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
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            value: selectedValue,
            checkColor: AppColor.yellowColor,
            activeColor: Colors.yellow,
            side: const BorderSide(
              color: AppColor.yellowColor,
            ),
            onChanged: (value) {
              selectedValue = value ?? false;
              widget.setValue(value);
              setState(() {});
            },
          ),
        ),
        Text(
          "Generate ReferralCode?",
          style: AppStyle.style21Medium(context),
        ),
      ],
    );
  }
}
