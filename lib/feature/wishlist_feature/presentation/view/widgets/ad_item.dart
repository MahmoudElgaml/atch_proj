import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/wishlist_feature/data/model/WishlistItemModel.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdWishlistItem extends StatelessWidget {
  const AdWishlistItem({super.key, required this.wishItem});

  final Wishlist wishItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 90 / 10,
              child: CachedNetworkImage(
                imageUrl: wishItem.images?[0] ?? "",
                errorWidget: (context, url, error) {
                  return Image.asset(Assets.assetsImagesEmptyImage);
                },
              ),
            ),
          ),
          Gap(20),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1st MAY-SAT-2.00 PM",
                  style: AppStyle.style13(context)
                      .copyWith(color: AppColor.primaryColor),
                ),
                Gap(5),
                Text(
                  "A virtual evening of smooth jazz",
                  style: AppStyle.style13(context)
                      .copyWith(color: AppColor.fontColor, fontSize: 16),
                )
              ],
            ),
          ),
          Icon(Icons.favorite_border)
        ],
      ),
    );
  }
}
