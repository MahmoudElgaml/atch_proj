import 'package:atch_proj/core/services/validation_service.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/upload_image_service.dart';
import '../../data/model/SignDataTest.dart';
import '../NewWidgets/signup_user_form.dart';
import '../manger/auth_cubit.dart';
import '../widgets/check_box.dart';
import '../NewWidgets/coatume_auth_button.dart';
import '../NewWidgets/costume_text_filed.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  dispose() {
    super.dispose();
    name.dispose();
    username.dispose();
    age.dispose();
    password.dispose();
    email.dispose();
  }

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
                Form(
                  key: _formKey,
                  child: SignUpUserForm(
                    age: age,
                    email: email,
                    name: name,
                    password: password,
                    username: username,
                  ),
                ),
                const Gap(28),
                CheckkBox(
                  setValue: (bool? valuee) {
                    selectedValue = valuee ?? false;
                  },
                ),
                const Gap(20),
                CostumeAuthButton(
                  title: "SignUp",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      SignDataTest signData = SignDataTest();
                      signData.password = password.text;
                      signData.username = username.text;
                      signData.name = name.text;
                      signData.email = email.text.trim();
                      signData.referralCode = selectedValue;
                      signData.age = age.text;
                      signData.role = "user";
                      signData.image = UploadImageService.imageFile;
                      AuthCubit.get(context).signIn(signData);
                    }
                  },
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
