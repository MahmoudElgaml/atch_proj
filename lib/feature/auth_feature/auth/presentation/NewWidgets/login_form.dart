import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/costume_text_filed.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.email, required this.password});

  final TextEditingController email;

  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CostumeTextFiled(
          title: "Email",
          textEditingController: email,
        ),
        const Gap(19),
        CostumeTextFiled(
          title: "Password",
          textEditingController: password,
          isPassword: true,
        ),
      ],
    );
  }
}
