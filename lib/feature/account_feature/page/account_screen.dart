import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/view/advertise_account_screen.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/view/user_account_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/service_locator/config.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String role = getIt<HiveManager>()
            .retrieveSingleData<Person>(HiveKeys.userBox)
            ?.role ??
        "user";
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          children: [
            Text(
              context.tr("navAccount"),
              style: AppStyle.style24Regular(context),
            ),
            const Gap(32),
            role == "user"
                ? const Expanded(child: UserAccountScreen())
                : const Expanded(child: AdvertiseAccountScreen()),
          ],
        ),
      ),
    );
  }
}
