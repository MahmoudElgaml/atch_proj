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
                campaigns!.locations!.isEmpty
                    ? "No Location"
                    : campaigns?.locations?.keys.toList().first ??
                        "No Location",
                style: AppStyle.style18(context).copyWith(
                    color: const Color(0xff8c8c8c),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: [
              const Gap(10),
              FittedBox(child: Text(campaigns?.offer.toString() ?? "")),
              const Gap(20),
              FittedBox(
                child: Text(
                  campaigns?.price.toString() ?? "",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
