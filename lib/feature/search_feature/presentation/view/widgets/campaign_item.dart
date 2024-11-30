import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/api/end_points.dart';

class CampaignItem extends StatelessWidget {
  const CampaignItem({super.key, required this.campaigns});

  final Campaigns campaigns;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoute.adDetails, extra: campaigns.id);
      },
      child: SizedBox(
        height: 130,
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: AppColor.PrimaryColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      height: double.infinity,
                      imageUrl: campaigns.images!.isEmpty
                          ? ""
                          : "${EndPoints.baseUrl}${campaigns.images?[0]}" ?? "",
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        Assets.imagesEmptyImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(18),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Text(
                                campaigns.campaignName ?? "",
                                style: AppStyle.style24Medium(context),
                              ),
                            ),
                            FittedBox(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    Assets.imagesNewLocation,
                                  ),
                                  const Gap(5),
                                  FittedBox(
                                    child: Text(
                                      campaigns.locations?.location0?.name ??
                                          " No Location ",
                                      style: AppStyle.style16Regular(context),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Gap(7),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            const Gap(25),
                            Text(
                              "EGP ${campaigns.offer.toString()}",
                              style: AppStyle.style24BoldDarkBlue(context)
                                  .copyWith(
                                color: AppColor.PrimaryColor,
                              ),
                            ),
                            Text(
                              "EGP ${campaigns.price.toString()}",
                              style: AppStyle.style16Bold(context).copyWith(
                                color: AppColor.PrimaryColor,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColor.PrimaryColor,
                              ),
                            ),
                            Text(
                              campaigns.endDate ?? "",
                              style: AppStyle.style16Regular(context),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
