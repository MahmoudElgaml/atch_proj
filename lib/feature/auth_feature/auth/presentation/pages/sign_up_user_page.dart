import 'package:atch_proj/core/services/validation_service.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/check_box.dart';
import '../widgets/coatume_auth_button.dart';
import '../widgets/costume_text_filed.dart';

class SignUpUserPage extends StatefulWidget {
  const SignUpUserPage({super.key});

  @override
  State<SignUpUserPage> createState() => _SignUpUserPageState();
}

class _SignUpUserPageState extends State<SignUpUserPage> {
  TextEditingController name = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();
  bool selectedValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                const TestUploadImage(isEdit: false),
                const Gap(37),
                SignUpUserForm(
                  age: age,
                  email: email,
                  name: name,
                  password: password,
                  username: username,
                ),
                const Gap(28),
                CheckkBox(
                  setValue: (bool? valuee) {
                    selectedValue = valuee ?? false;
                  },
                ),
                const Gap(20),
                CostumeButton(
                  title: "SignUp",
                  onPressed: () {},
                  isLoading: false,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpUserForm extends StatelessWidget {
  const SignUpUserForm({
    super.key,
    required this.name,
    required this.username,
    required this.age,
    required this.password,
    required this.email,
  });

  final TextEditingController name;

  final TextEditingController username;
  final TextEditingController age;

  final TextEditingController password;
  final TextEditingController email;

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
        CostumeTextFiled(
          isPassword: true,
          title: "Password",
          textEditingController: password,
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
