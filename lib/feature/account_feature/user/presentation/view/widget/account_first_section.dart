import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/constants.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../generated/assets.dart';
import '../../../../../auth_feature/auth/data/model/UserData.dart';
import '../user_account_screen.dart';

class AccountFirstSection extends StatelessWidget {
  const AccountFirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    Person person =
        getIt<HiveManager>().retrieveData<Person>(HiveKeys.userBox)[0];

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .3,
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              child: ClipOval(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  imageUrl: person.profilePic ?? ConstValue.emptyImage,
                  errorWidget: (context, url, error) =>
                      Image.asset(Assets.assetsImagesEmptyImage),
                ),
              ),
            ),
            const Gap(10),
            Text(
              person.username ?? "",
              style: AppStyle.style24Regular(context),
            ),
            const Gap(16),
            BlocBuilder<AdvertiseInfoCubit, AdvertiseInfoState>(
              builder: (context, state) {
                return InkWell(
                  onTap: AdvertiseInfoCubit.get(context).isDone
                      ? () {
                          Advertiser? advertiser =
                              AdvertiseInfoCubit.get(context)
                                  .advertiseInfoModel
                                  ?.advertiser
                                  ?.copyWith();
                          context.push(AppRoute.editUserPage,
                              extra: advertiser);
                        }
                      : null,
                  child: const EditButton(),
                );
              },
            )
          ],
        ),
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
            "Edit Profile",
            style: AppStyle.style16Bold(context)
                .copyWith(color: AppColor.primaryColor),
          )
        ],
      ),
    );
  }
}
