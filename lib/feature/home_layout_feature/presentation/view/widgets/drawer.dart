import 'package:animations/animations.dart';
import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/constants.dart';
import 'package:atch_proj/core/utils/models/drawer_item_model.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/drawer_cubit.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/contact_us_dialog.dart';
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
    DrawerItemModel("AllAds", Assets.imagesAllCampaign),
    DrawerItemModel("setting", Assets.imagesSettingssvg),
    DrawerItemModel("contact", Assets.imagesContact),
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
              ImageAndName(userData: userData),
              const Gap(60),
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
                                    transitionDuration: Duration(seconds: 1),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return const ContactUsDialog();
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
                    DrawerItemModel(context.tr("logout"), Assets.imagesLogOut),
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

class ImageAndName extends StatelessWidget {
  const ImageAndName({super.key, required this.userData});

  final Person? userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.PrimaryColor, width: 2.5)),
            width: 118,
            height: 118,
            child: ClipOval(
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                imageUrl: "${EndPoints.baseUrl}${userData?.profilePic}" ?? "",
                errorWidget: (context, url, error) {
                  return Image.network(ConstValue.emptyImage);
                },
              ),
            ),
          ),
        ),
        const Gap(12),
        Center(
          child: Text(
            userData?.username ?? "",
            style: AppStyle.style18ExtraBold(context),
          ),
        ),
      ],
    );
  }
}
