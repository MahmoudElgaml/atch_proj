import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/select_role_section.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/coatume_auth_button.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/costume_text_filed.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 150, left: 50, right: 50, bottom: 58),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.red,
                  child: Image.asset(Assets.imagesNewLogo),
                ),
                const Gap(52),
                const SelectRoleSection(),
                const Gap(37),
                const CostumeTextFiled(
                  title: "Email",
                  textEditingController: null,
                ),
                const Gap(19),
                const CostumeTextFiled(
                  title: "Password",
                  textEditingController: null,
                  isPassword: true,
                ),
                const Gap(100),
                TextButton(onPressed: () {}, child: const Text("Now here?")),
                CostumeButton(
                    title: "Login", onPressed: () {}, isLoading: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
