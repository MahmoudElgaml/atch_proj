import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/validation_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/validation_service.dart';
import '../pages/sign_up_user_page.dart';
import 'costume_text_filed.dart';

class SignUpUserForm extends StatelessWidget {
  const SignUpUserForm({
    super.key,
    required this.name,
    required this.username,
    required this.age,
    required this.password,
    required this.email,
    required this.isEditAccount,
  });

  final TextEditingController name;

  final TextEditingController username;
  final TextEditingController age;

  final TextEditingController password;
  final TextEditingController email;
  final bool isEditAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CostumeTextFiled(
          title: "Full Name",
          textEditingController: name,
        ),
        const Gap(32),
        CostumeTextFiled(
          title: "userName",
          textEditingController: username,
        ),
        const Gap(32),
        CostumeTextFiled(
          validator: (value) => ValidationService.validateEmail(value),
          title: "Email",
          textEditingController: email,
        ),
        const Gap(20),
        isEditAccount
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CostumeTextFiled(
                    validator: (value) =>
                        ValidationService.validate8CharAndSpecialChar(value),
                    isPassword: true,
                    title: "Password",
                    textEditingController: password,
                  ),
                  ValidationForm(
                    password: password,
                  ),
                ],
              ),
        const Gap(20),
        SizedBox(
          width: MediaQuery.of(context).size.width * .3,
          child: CostumeTextFiled(
            keyboardType: TextInputType.number,
            title: "Age",
            textEditingController: age,
          ),
        ),
      ],
    );
  }
}
