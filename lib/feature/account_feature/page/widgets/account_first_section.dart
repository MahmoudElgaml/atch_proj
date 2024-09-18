import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/utils/constants.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:atch_proj/feature/account_feature/page/manger/delete_account_cubit.dart';
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

    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            child: ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                imageUrl: "${EndPoints.baseUrl}${person?.profilePic}",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<DeleteAccountCubit, DeleteAccountState>(
                listener: (context, state) async {
                  if (state is DeleteAccountLoadingState) {
                    EasyLoading.show();
                  } else if (state is DeleteAccountFailState) {
                    EasyLoading.showError(state.message);
                  }
                  if (state is DeleteAccountSuccessState) {
                    EasyLoading.showSuccess("");
                    await Helper.retrievePerson()?.delete();
                    getIt<StorageToken>().deleteToken();
                    if (context.mounted) {
                      context.go(AppRoute.logInKey);
                    }
                  }
                },
                child: InkWell(
                  onTap: () {
                    DeleteAccountCubit.get(context)
                        .deleteAccountForBoth(person?.id, person?.role);
                  },
                  child: const EditButton(
                    title: "deleteAccount",
                    icon: Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
              const Gap(20),
              Helper.retrieveRole() == "user"
                  ? InkWell(
                      onTap: () => context.push(AppRoute.editUserPage),
                      child: const EditButton(
                        title: "editProfile",
                        color: AppColor.primaryColor,
                        icon: Icons.edit,
                      ),
                    )
                  : const EditButtonBuilderForAdv(),
            ],
          )
        ],
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 19),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.50,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: color,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 25,
            color: color,
          ),
          const Gap(10),
          Text(
            context.tr(title),
            style: AppStyle.style16Bold(context).copyWith(color: color),
          )
        ],
      ),
    );
  }
}
