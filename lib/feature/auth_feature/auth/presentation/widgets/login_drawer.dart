import 'package:atch_proj/core/services/validation_service.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/custom_drop_menu.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
import 'coatume_auth_button.dart';
import 'costume_text_filed.dart';

class LogInDrawer extends StatefulWidget {
  const LogInDrawer({super.key});

  @override
  State<LogInDrawer> createState() => _LogInDrawerState();
}

class _LogInDrawerState extends State<LogInDrawer> {
  Map<String, String> items = {
    "advertiser": "advertiser",
    "user": "user",
  };
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String selectedValue = "user";
  var formKey = GlobalKey<FormState>();
@override
  void dispose() {
  super.dispose();
  email.text="";
  password.text="";
    email.dispose();
    password.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 281),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 36, right: 36),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: AppStyle.style34(context),
                ),
                const Gap(32),
                CostumeTextFiled(
                  validator: (value) =>
                      ValidationService.validateEmpty(value, "Email"),
                  title: "Email",
                  textEditingController: email,
                ),
                const Gap(32),
                CostumeTextFiled(
                  isPassword: true,
                  validator: (value) =>
                      ValidationService.validateEmpty(value, "Password"),
                  title: "password",
                  textEditingController: password,
                ),
                const Gap(30),
                CustomDropMenu(
                  isAuth: true,
                  selectedValue: selectedValue,
                  setValue: (value) {
                    selectedValue = value;
                  },
                  items: items,
                ),
                const Gap(20),
                CostumeButton(
                  title: 'Login',
                  isLoading: true,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthCubit.get(context)
                          .logIn(email.text, password.text, selectedValue);
                    }
                  },
                ),
                const Gap(32),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      style: AppStyle.styleRegularOpacity,
                      "NewUser? ",
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Create Account",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () =>
                              context.go(AppRoute.signUpAsAdvertise),
                          child: const Text(
                            "Advertise",
                            style: TextStyle(color: AppColor.authColor),
                          ),
                        ),
                        const Text("or"),
                        TextButton(
                          onPressed: () => context.go(AppRoute.signInKey),
                          child: const Text(
                            "User",
                            style: TextStyle(color: AppColor.authColor),
                          ),
                        ),
                      ],
                    ),
                    const Gap(15)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
