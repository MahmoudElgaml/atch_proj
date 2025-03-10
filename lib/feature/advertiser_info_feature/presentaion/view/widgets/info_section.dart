import 'package:atch_proj/core/utils/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/api/end_points.dart';
import '../../../../../generated/assets.dart';
import '../../../../adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'message_button.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required this.advertiser});

  final DetailAdvertiser advertiser;

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
                      "${EndPoints.baseUrl}${advertiser.profilePic}" ?? "",
                  errorWidget: (context, url, error) =>
                      Image.asset(Assets.assetsImagesEmptyImage),
                ),
              ),
            ),
            const Gap(20),
            Text(
              advertiser.name ?? "",
              style: AppStyle.style24Regular(context),
            ),
            const Gap(10),
            MessageButton(
              number: advertiser.phone?.first,
              locations: advertiser.locations ?? {},
              phones: advertiser.phone ?? [],
            )
          ],
        ),
      ),
    );
  }
}
