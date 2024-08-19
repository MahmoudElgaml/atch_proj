import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/view/user_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Account",
              style: AppStyle.style24Regular(context),
            ),
            Gap(32),
            const UserAccountScreen()

          ],
        ),
      ),
    );
  }
}

