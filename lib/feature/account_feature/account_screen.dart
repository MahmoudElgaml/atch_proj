import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/view/advertise_account_screen.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/view/user_account_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/utils/service_locator/config.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String role= getIt<HiveManager>().retrieveData<Person>(HiveKeys.userBox)[0].role??"user";
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Account",
              style: AppStyle.style24Regular(context),
            ),
            const Gap(32),
           role=="user"? const UserAccountScreen():const AdvertiseAccountScreen()

          ],
        ),
      ),
    );
  }
}

