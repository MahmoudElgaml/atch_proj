import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/validation_service.dart';
import '../manger/auth_cubit.dart';
import '../widgets/costume_text_filed.dart';

class SignUpAdvertiseForm1 extends StatelessWidget {
  const SignUpAdvertiseForm1({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    return Column(
      children: [
        CostumeTextFiled(
          validator: (value) =>
              ValidationService.validateEmpty(value, "Company"),
          title: "Company Name",
          textEditingController: authCubit.companyName,
        ),
        const Gap(24),
        CostumeTextFiled(
          validator: (value) =>
              ValidationService.validateEmpty(value, "Advertise Name"),
          title: "Advertise Name",
          textEditingController: authCubit.advertiseName,
        ),
        const Gap(24),
        CostumeTextFiled(
          validator: (value) => ValidationService.validateEmail(value),
          title: "Email",
          textEditingController: authCubit.email,
        ),
        const Gap(24),
        CostumeTextFiled(
          isPassword: true,
          validator: (value) =>
              ValidationService.validateEmpty(value, "Password"),
          title: "Password",
          textEditingController: authCubit.password,
        ),
      ],
    );
  }
}
