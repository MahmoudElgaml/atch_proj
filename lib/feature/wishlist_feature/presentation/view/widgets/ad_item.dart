import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/manger/wishlist_cubit.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class AdWishlistItem extends StatelessWidget {
  const AdWishlistItem({super.key, required this.campaign});

  final Campaigns campaign;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 79 / 92,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: campaign.images!.isEmpty
                        ? ""
                        : campaign.images?[0] ?? "",
                    errorWidget: (context, url, error) {
                      return SvgPicture.asset(
                        Assets.imagesEmptyImage,
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
              ),
            ),
            const Gap(20),
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
                  const Gap(5),
                  Text(
                    "A virtual evening of smooth jazz",
                    style: AppStyle.style13(context)
                        .copyWith(color: AppColor.fontColor, fontSize: 16),
                  )
                ],
              ),
            ),
             IconButton(
                onPressed: () {
                  WishlistCubit.get(context).addToWishList(campaign.id!);
                  Helper.retrievePerson().wishlist?.remove(campaign.id);
                  Helper.retrievePerson().save();
                },
              icon: const Icon(
                Icons.favorite_outlined,
              ),
              color: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}
