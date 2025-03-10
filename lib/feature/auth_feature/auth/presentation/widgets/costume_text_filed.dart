import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/helper.dart';

class CostumeTextFiled extends StatelessWidget {
  const CostumeTextFiled(
      {required this.title,
      super.key,
      required this.textEditingController,
      this.validator,
      this.keyboardType,
      this.isPassword,
      this.maxLine});

  final TextEditingController? textEditingController;
  final String title;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 13),
        ),
        const Gap(10),
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
              focusedErrorBorder: Helper.buildOutlineInputBorder(),
              errorBorder: Helper.buildOutlineInputBorder(),
              focusedBorder: Helper.buildOutlineInputBorder(),
              enabledBorder: Helper.buildOutlineInputBorder()),
        )
      ],
    );
  }
}
