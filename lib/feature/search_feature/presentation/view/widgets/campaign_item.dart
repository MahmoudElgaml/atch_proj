import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CampaignItem extends StatelessWidget {
  const CampaignItem({super.key, required this.campaigns});

  final Campaigns campaigns;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.white24,
      color: Colors.white24,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 92,
                width: 79,
                child: AspectRatio(
                  aspectRatio: 79 / 92,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: campaigns.images!.isEmpty
                          ? ""
                          : campaigns.images?[0] ?? "",
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) =>
                          Image.asset(Assets.assetsImagesEmptyImage)
                    ),
                  ),
                ),
              ),
            ),
            const Gap(18),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    campaigns.endDate?.substring(0, 16) ?? " No Date",
                    style: AppStyle.style18Regular(context),
                  ),
                  Text(
                    campaigns.campaignName ?? "",
                    style: AppStyle.style18(context),
                  ),
                  const Gap(7),
                  FittedBox(
                    child: SizedBox(
                      width: 170,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        campaigns.description ?? "",
                        maxLines: 2,
                        style: AppStyle.style18(context),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
