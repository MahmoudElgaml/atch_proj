import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/select_role_section.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/coatume_auth_button.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/costume_text_filed.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../NewWidgets/login_form.dart';
import '../manger/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 150, left: 50, right: 50, bottom: 58),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesNewLogo),
                  const Gap(52),
                  const SelectRoleSection(),
                  const Gap(37),
                  LoginForm(
                    email: email,
                    password: password,
                  ),
                  const Gap(100),
                  TextButton(
                      onPressed: () {
                        context.push(AppRoute.selectRole);
                      },
                      child: const Text("Now here?")),
                  CostumeButton(
                      title: "Login",
                      onPressed: () {
                        String role = AuthCubit.get(context).isAdvertiser
                            ? "advertiser"
                            : "user";
                        if (formKey.currentState!.validate()) {
                          AuthCubit.get(context)
                              .logIn(email.text.trim(), password.text, role);
                        }
                      },
                      isLoading: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
