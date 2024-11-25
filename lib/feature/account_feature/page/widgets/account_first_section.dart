import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/utils/constants.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:atch_proj/feature/account_feature/page/manger/delete_account_cubit.dart';
import 'package:atch_proj/feature/account_feature/page/widgets/confirm_delete_dialog.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';
import '../../../auth_feature/auth/data/model/UserData.dart';
import '../../advertise/presentation/view/widgets/edit_button_for_adv.dart';

class AccountFirstSection extends StatelessWidget {
  const AccountFirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    Person? person =
        getIt<HiveManager>().retrieveSingleData<Person>(HiveKeys.userBox);

    return FittedBox(
      child: Center(
        child: Column(
          children: [
            ImageAndName(
              userData: person,
              isDrawer: false,
            ),
            const Gap(12),
            Helper.retrieveRole() == "user"
                ? InkWell(
                    onTap: () => context.push(AppRoute.editUserPage),
                    child: const EditButton(
                      title: "editProfile",
                      color: AppColor.PrimaryColor,
                      icon: Icons.edit,
                    ),
                  )
                : const EditButtonBuilderForAdv()
          ],
        ),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.color});

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 28),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: color,
            ),
            borderRadius: BorderRadius.circular(500),
          ),
        ),
        child: Text(
          context.tr(title),
          style: AppStyle.style16Regular(context).copyWith(color: color),
        ),
      ),
    );
  }
}
