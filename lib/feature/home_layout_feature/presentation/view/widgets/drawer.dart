import 'package:animations/animations.dart';
import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/constants.dart';
import 'package:atch_proj/core/utils/models/drawer_item_model.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/drawer_cubit.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/drawer_item.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/referral_code_qr_widget.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/api/end_points.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  static const List<DrawerItemModel> items = [
    DrawerItemModel("contact", Icons.mail_outline_outlined),
    DrawerItemModel("setting", Icons.settings),
    DrawerItemModel("AllAds", Icons.verified_user_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    Person? userData =
        getIt<HiveManager>().retrieveSingleData<Person>(HiveKeys.userBox);

    return Drawer(
      width: MediaQuery.sizeOf(context).width * .7,
      child: Padding(
        padding: const EdgeInsets.only(top: 45, left: 24, right: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: CachedNetworkImage(
                    imageUrl:
                        "${EndPoints.baseUrl}${userData?.profilePic}" ?? "",
                    errorWidget: (context, url, error) {
                      return Image.network(ConstValue.emptyImage);
                    },
                  ),
                ),
              ),
              const Gap(12),
              Text(
                userData?.username ?? "",
                style: AppStyle.style18ExtraBold(context),
              ),
              const Gap(40),
              Column(
                children: items
                    .map(
                      (e) => DrawerItem(
                        onPressed: () {
                          switch (e.title) {
                            case "setting":
                              {
                                context.push(AppRoute.setting);
                              }
                            case "AllAds":
                              {
                                context.push(AppRoute.allAds);
                              }
                            case "contact":
                              {
                                showModal(
                                  configuration:
                                      const FadeScaleTransitionConfiguration(
                                          transitionDuration:
                                              Duration(seconds: 1)),
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Our Social Media",
                                              style: AppStyle.style18Regular(
                                                  context),
                                            ),
                                            const Gap(10),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(Assets
                                                      .imagesFacebookIcon),
                                                  const Gap(10),
                                                  SvgPicture.asset(Assets
                                                      .imagesLinkedinIcon),
                                                  const Gap(10),
                                                  SvgPicture.asset(
                                                      Assets.imagesWhatsIcon),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                          }
                        },
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
                      ?.delete();
                  context.go(AppRoute.logInKey);
                },
                drawerItemModel:
                    DrawerItemModel(context.tr("logout"), Icons.login),
              ),
              const Gap(20),
              Row(
                children: [
                  const Text("Your id :"),
                  Text(userData?.id?.toString() ?? ""),
                ],
              ),
              userData?.referralCode == null
                  ? const SizedBox()
                  : const ReferralCodeQrWidget()
            ],
          ),
        ),
      ),
    );
  }
}
