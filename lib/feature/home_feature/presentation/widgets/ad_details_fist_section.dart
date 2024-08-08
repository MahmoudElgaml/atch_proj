import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdDetailsFistSection extends StatelessWidget {
  const AdDetailsFistSection({super.key, required this.campaign});

  final Campaigns campaign;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CachedNetworkImage(
        imageUrl:
            campaign.images!.isEmpty ? " " : campaign.images?.first ?? " ",
        errorWidget: (context, url, error) => SvgPicture.asset(
          Assets.imagesEmptyImage,
          fit: BoxFit.fill,
        ),
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38.0),
              child: Text(
                "AD Details",
                style: AppStyle.style34(context)
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
              ),
            ),
            const Gap(110),
            Image.asset(Assets.imagesFavIcon)
          ],
        ),
      ),
      Container(),
    ]);
  }
}
