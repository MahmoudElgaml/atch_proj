import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/components/save_button.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdsItem extends StatelessWidget {
  const AdsItem({super.key, this.campaigns});

  final Campaigns? campaigns;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.adDetails, extra: campaigns);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xff8c8c8c),
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 218 / 113,
                  child: SizedBox(
                    width: 218,
                    height: 113,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: campaigns!.images!.isEmpty
                            ? ""
                            : campaigns?.images?[0] ?? "",
                        errorWidget: (context, url, error) => SvgPicture.asset(
                          Assets.imagesEmptyImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(14),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        campaigns?.campaignName ?? "",
                        style: AppStyle.style18(context),
                      ),
                      const Gap(12),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xff8c8c8c),
                          ),
                          Text(
                            "October City - Giza",
                            style: AppStyle.style18(context).copyWith(
                                color: const Color(0xff8c8c8c),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Gap(10),
                          Text(campaigns?.offer.toString() ?? ""),
                          const Gap(20),
                          Text(
                            campaigns?.price.toString() ?? "",
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: SaveButton(),
            ),
          ],
        ),
      ),
    );
  }
}
