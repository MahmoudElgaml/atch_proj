import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
import '../../data/model/SignData.dart';
import '../manger/auth_cubit.dart';
import 'coatume_button.dart';
import 'costume_text_filed.dart';
import 'custom_drop_menu.dart';

class SignUpAdvertise extends StatefulWidget {
  const SignUpAdvertise({super.key});

  @override
  State<SignUpAdvertise> createState() => _SignUpAdvertiseState();
}

class _SignUpAdvertiseState extends State<SignUpAdvertise> {
  TextEditingController name = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 36, right: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TestUploadImage(),
              Gap(20),
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
                title: "Password",
                textEditingController: password,
              ),
              const Gap(30),

              const Gap(25),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  style: AppStyle.styleRegularOpacity,
                  AppString.helpMessage,
                ),
              ),
              const Gap(20),
              CostumeButton(
                title: "SignUP",
                onPressed: () {
                  SignData signData = SignData();
                  signData.password = password.text;
                  signData.username = username.text;
                  signData.age = age.text;
                  signData.email = email.text;
                  signData.name = name.text;

                  AuthCubit.get(context).signIn(signData);
                },
                isLoading: false,
              ),
              const Gap(32),
              Center(
                child: Text(
                  style: AppStyle.styleRegularOpacity,
                  "or Sign Un With",
                ),
              ),
              const Gap(28),
              const Center(child: SocialButton()),
              const Gap(28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(style: AppStyle.styleRegularOpacity, "Existing User? "),
                  InkWell(
                    onTap: () {
                      context.go(AppRoute.logInKey);
                    },
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
        ),
      ),
    );
  }
}
