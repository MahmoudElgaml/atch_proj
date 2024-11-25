import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_style.dart';

class AdsItemDetails extends StatelessWidget {
  const AdsItemDetails({super.key, required this.campaigns});

  final Campaigns? campaigns;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            campaigns?.campaignName ?? "",
            style: AppStyle.style16Regular(context),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${campaigns?.price.toString()} LE",
                style: AppStyle.style20Bold(context),
              ),
              Column(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xff8c8c8c),
                  ),
                  Text(
                    campaigns!.locations!.isEmpty
                        ? "No Location"
                        : campaigns?.locations?.keys.toList().first ??
                            "No Location",
                    style: AppStyle.style12Regular(context).copyWith(
                        color: const Color(0xff8c8c8c),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
