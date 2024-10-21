import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/core/services/validation_service.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/SignDataTest.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/check_box.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
import '../NewWidgets/coatume_auth_button.dart';
import '../NewWidgets/costume_text_filed.dart';

class UserSignUpDrawer extends StatefulWidget {
  const UserSignUpDrawer({super.key});

  @override
  State<UserSignUpDrawer> createState() => _SignUpDrawerState();
}

class _SignUpDrawerState extends State<UserSignUpDrawer> {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  bool selectedValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 36, right: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Sign Up",
              style: AppStyle.style34(context),
            ),
          ),
          const Gap(32),
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
            title: "Email",
            textEditingController: email,
          ),
          const Gap(20),
          CostumeTextFiled(
            title: "Age",
            textEditingController: age,
          ),
          const Gap(20),
          CostumeTextFiled(
           isPassword: true,
            title: "Password",
            textEditingController: password,
          ),
          const Gap(30),
          CheckkBox(
            setValue: (bool? valuee) {
              selectedValue = valuee ?? false;
            },
          ),
          const Gap(25),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              style: AppStyle.styleRegularOpacity,
              AppString.helpMessage,
            ),
          ),
          const Gap(20),
          CostumeAuthButton(
            title: "SignUP",
            onPressed: () {
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
            },
            isLoading: false,
          ),
          const Gap(28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(style: AppStyle.styleRegularOpacity, "Existing User? "),
              TextButton(
                onPressed: () => context.go(AppRoute.logInKey),
                child: const Text(
                  "Log in",
                  style: TextStyle(color: AppColor.authColor),
                ),
              ),
            ],
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
