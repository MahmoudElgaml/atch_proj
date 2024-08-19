import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../generated/assets.dart';
import '../user_account_screen.dart';

class AccountFirstSection extends StatelessWidget {
  const AccountFirstSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                  imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlie4MsQ9pJSSKY7DoEpxn3uBAq-rT7in1sA&s",
                  errorWidget: (context, url, error) =>
                      Image.asset(Assets.assetsImagesEmptyImage),
                ),
              ),
            ),
            const Gap(16),
            const EditButton()
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