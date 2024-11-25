import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/models/drawer_item_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.drawerItemModel, this.onPressed});

  final DrawerItemModel drawerItemModel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onPressed,
        leading: SvgPicture.asset(drawerItemModel.iconPath),
        title: Text(
          context.tr(drawerItemModel.title),
          style: AppStyle.style21Medium(context)
              .copyWith(color: AppColor.PrimaryColor),
        ),
      ),
    );
  }
}
