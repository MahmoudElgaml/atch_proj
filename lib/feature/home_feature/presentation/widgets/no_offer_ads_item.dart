import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/components/save_button.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ads_item_details.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NoOfferAdsItem extends StatelessWidget {
  const NoOfferAdsItem({super.key, required this.campaigns});

  final Campaigns campaigns;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.adDetails, extra: campaigns.id);
      },
      child: Card(
        borderOnForeground: true,
        shadowColor: Colors.black26,
        elevation: 20,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: AppColor.PrimaryColor,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  child: AspectRatio(
                    aspectRatio: 167 / 140,
                    child: CachedNetworkImage(
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      imageUrl: campaigns.images!.isEmpty
                          ? ""
                          : "${EndPoints.baseUrl}${campaigns.images?[0]}" ?? "",
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        Assets.imagesEmptyImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Gap(9),
                AdsItemDetails(
                  campaigns: campaigns,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SaveButton(
                campaignId: campaigns.id!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
