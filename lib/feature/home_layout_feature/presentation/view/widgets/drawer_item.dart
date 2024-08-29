import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/models/drawer_item_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.drawerItemModel, this.onPressed});

  final DrawerItemModel drawerItemModel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onPressed,
      leading: Icon(
        drawerItemModel.iconData,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        context.tr(drawerItemModel.title),
        style: AppStyle.style18ExtraBold(context),
      ),
    );
  }
}
