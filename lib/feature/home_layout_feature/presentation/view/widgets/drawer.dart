import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/constants.dart';
import 'package:atch_proj/core/utils/models/drawer_item_model.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/drawer_item.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/referral_code_qr_widget.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  static const List<DrawerItemModel> items = [
    DrawerItemModel("Contact Us", Icons.mail_outline_outlined),
    DrawerItemModel("Settings", Icons.settings),
    DrawerItemModel("All Ads ", Icons.verified_user_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    Person userData =
        HiveManager().retrieveSingleData<Person>(HiveKeys.userBox);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 45, left: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CachedNetworkImage(
                    imageUrl: userData.profilePic ?? "",
                    errorWidget: (context, url, error) {
                      return Image.network(ConstValue.emptyImage);
                    },
                  ),
                ),
              ),
              const Gap(12),
              Text(
                userData.username ?? "",
                style: AppStyle.style18ExtraBold(context),
              ),
              const Gap(40),
              Column(
                children: items
                    .map(
                      (e) => DrawerItem(
                        drawerItemModel: e,
                      ),
                    )
                    .toList(),
              ),
              const Gap(100),
              DrawerItem(
                onPressed: () {
                  getIt<StorageToken>().deleteToken();
                  getIt<HiveManager>()
                      .retrieveSingleData<Person>(HiveKeys.userBox)
                      .delete();
                  context.go(AppRoute.logInKey);
                },
                drawerItemModel: const DrawerItemModel("Sign Out", Icons.login),
              ),
              const Gap(20),
              userData.referralCode == null
                  ? const SizedBox()
                  : const ReferralCodeQrWidget()
            ],
          ),
        ),
      ),
    );
  }
}
