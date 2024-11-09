import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/helper.dart';

class CostumeTextFiled extends StatelessWidget {
  const CostumeTextFiled({
    required this.title,
    super.key,
    required this.textEditingController,
    this.validator,
    this.keyboardType,
    this.isPassword,
    this.maxLine,
    this.withoutTitle = false,
    this.withoutLabel = true,
  });

  final TextEditingController? textEditingController;
  final String title;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final int? maxLine;
  final bool withoutTitle;
  final bool withoutLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        withoutTitle
            ? const SizedBox()
            : Text(
                title,
                style: AppStyle.style21Medium(context),
              ),
        const Gap(5),
        TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          maxLines: maxLine ?? 1,
          obscureText: isPassword ?? false,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          controller: textEditingController,
          decoration: InputDecoration(
              label: withoutLabel
                  ? null
                  : Text(
                      title,
                      style: AppStyle.style21Medium(context),
                    ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              focusedErrorBorder: Helper.buildOutlineInputBorder(),
              errorBorder: Helper.buildOutlineInputBorder(),
              focusedBorder: Helper.buildOutlineInputBorder(),
              enabledBorder: Helper.buildOutlineInputBorder()),
        )
      ],
    );
  }
}
