import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/models/drawer_item_model.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/drawer_item.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> items = [
      DrawerItemModel("Contact Us", Icons.mail_outline_outlined),
      DrawerItemModel("Settings", Icons.settings),
      DrawerItemModel("All Ads ", Icons.verified_user_rounded),
    ];
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 45, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesTestImageProfile),
                    fit: BoxFit.fill,
                  )),
            ),
            Gap(12),
            Text(
              "Ashfak Sayem",
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
            Gap(164),
            DrawerItem(drawerItemModel: DrawerItemModel("Sign Out",Icons.login))
          ],
        ),
      ),
    );
  }
}
