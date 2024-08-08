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
import 'coatume_button.dart';
import 'costume_text_filed.dart';

class LogInDrawer extends StatefulWidget {
  const LogInDrawer({super.key});

  @override
  State<LogInDrawer> createState() => _LogInDrawerState();
}

class _LogInDrawerState extends State<LogInDrawer> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String selectedValue = "user";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(top: 281),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 36, right: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: AppStyle.style34(context),
              ),
              const Gap(32),
              CostumeTextFiled(
                title: "Email",
                textEditingController: email,
              ),
              const Gap(32),
              CostumeTextFiled(
                title: "password",
                textEditingController: password,
              ),
              const Gap(30),
              CustomDropMenu(
                selectedValue: selectedValue,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  style: AppStyle.styleRegularOpacity,
                  AppString.helpMessage,
                ),
              ),
              const Gap(20),
              CostumeButton(
                title: 'Login',
                isLoading: true,
                onPressed: () {
                  AuthCubit.get(context)
                      .logIn(email.text, password.text, selectedValue);
                },
              ),
              const Gap(32),
              Center(
                child: Text(
                  style: AppStyle.styleRegularOpacity,
                  "or Log in With",
                ),
              ),
              const Gap(28),
              const Center(child: SocialButton()),
              const Gap(28),
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
                        onPressed: () => context.go(AppRoute.signUpAsAdvertise),
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
    );
  }
}
