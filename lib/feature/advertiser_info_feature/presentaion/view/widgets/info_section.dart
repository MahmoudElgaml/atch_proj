import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/assets.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key,required this.advertiser});
final Advertiser advertiser;
  @override
  Widget build(BuildContext context) {
    return    SizedBox(
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
                  imageUrl: advertiser.advertiserPic ?? "",
                  errorWidget: (context, url, error) =>
                      Image.asset(Assets.assetsImagesEmptyImage),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
