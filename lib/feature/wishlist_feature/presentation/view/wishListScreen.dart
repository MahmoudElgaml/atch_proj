import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Gap(MediaQuery.of(context).size.height * .03),
            Image.asset(Assets.imagesMiniLogo),
            const Gap(20),
            Text(
              "0 more",
              style:
                  AppStyle.style13(context).copyWith(color: AppColor.fontColor),
            ),
            Gap(MediaQuery.of(context).size.height * 0.25),
            Center(
              child: Column(
                children: [
                  Image.asset(Assets.imagesWishlist),
                ],
              ),
            ),
            Gap(MediaQuery.of(context).size.height * 0.09),
            Text(
              "No favourites yet",
              style: AppStyle.style26(context),
            ),
            Text(
              "Tap heart next to the product, We'll save them for you here",
              style:
                  AppStyle.style13(context).copyWith(color: AppColor.fontColor),
            ),

          ],
        ),
      ),
    );
  }
}
