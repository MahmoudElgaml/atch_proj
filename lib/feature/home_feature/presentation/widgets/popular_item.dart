import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/components/save_button.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ads_item_details.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdsItem extends StatelessWidget {
  const AdsItem({super.key, required this.campaigns});

  final Campaigns campaigns;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.adDetails, extra: campaigns.id);
      },
      child: AspectRatio(
        aspectRatio: 354 / 167,
        child: Card(
          borderOnForeground: true,
          shadowColor: Colors.black26,
          elevation: 20,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Color(0xff8c8c8c),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: CachedNetworkImage(
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
              buildCardDetail(context)
            ],
          ),
        ),
      ),
    );
  }

  Container buildCardDetail(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.59),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(campaigns.campaignName ?? "",
                style: AppStyle.style16Medium(context)),
            FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${campaigns.offer.toString()} LE" ?? "",
                      style: AppStyle.style16Bold(context)),
                  Text("${campaigns.price.toString()} LE" ?? "",
                      style: AppStyle.style10Bold(context)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
