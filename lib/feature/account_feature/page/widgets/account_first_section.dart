import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/constants.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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

    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                imageUrl: "${EndPoints.baseUrl}${person?.profilePic}"
                   ,
                errorWidget: (context, url, error) =>
                    Image.network(ConstValue.emptyImage),
              ),
            ),
          ),
          const Gap(10),
          Text(
            person?.username ?? "",
            style: AppStyle.style24Regular(context),
          ),
          const Gap(16),
          Helper.retrieveRole() == "user"
              ? InkWell(
                  onTap: () => context.push(AppRoute.editUserPage),
                  child: const EditButton(),
                )
              : const EditButtonBuilderForAdv()
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 19),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: AppColor.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.edit,
            size: 25,
            color: AppColor.primaryColor,
          ),
          const Gap(10),
          Text(
           context.tr("editProfile"),
            style: AppStyle.style16Bold(context)
                .copyWith(color: AppColor.primaryColor),
          )
        ],
      ),
    );
  }
}
