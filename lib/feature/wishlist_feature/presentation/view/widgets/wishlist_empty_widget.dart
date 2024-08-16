import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/assets.dart';

class WishlistEmptyWidget extends StatelessWidget {
  const WishlistEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(20),
          Image.asset(Assets.imagesWishlist),
          Text(
            "No favourites yet",
            style: AppStyle.style26(context),
          ),
          Text(
            "Tap heart next to the product, We'll save them for you here",
            style: AppStyle.style13(context)
                .copyWith(color: AppColor.fontColor),
          ),
        ],
      ),
    );

  }
}
