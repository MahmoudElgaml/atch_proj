import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/widget/ad_details_fist_section.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'ad_details_button.dart';
import 'ad_details_location_widget.dart';
import 'add_detail_widget.dart';

class AdDetailsSection extends StatelessWidget {
  const AdDetailsSection({super.key, required this.campaign});

  final Campaigns campaign;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .35,
            child: AdDetailsFistSection(campaign: campaign),
          ),
          const Gap(30),
          Center(
            child: Text(
              campaign.campaignName ?? "",
              style: AppStyle.style34(context).copyWith(
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Gap(50),
                AdDetailsWidget(
                  isProfile: false,
                  image: Assets.imagesDate,
                  first: campaign.startDate,
                  last: campaign.endDate,
                ),
                const Gap(25),
                AdDetailsLocationWidget(
                    Assets.imagesLocation, campaign.locations ?? []),
                const Gap(25),
                InkWell(
                  onTap: () => context.push(AppRoute.advertiserInfoPage,extra: campaign.advertiser),
                  child: AdDetailsWidget(
                    isProfile: true,
                    imageAdvertise: campaign.advertiser?.advertiserPic ?? "",
                    first: campaign.advertiser?.advertiserName,
                    last: "Advertiser",
                  ),
                ),
                Gap(MediaQuery.sizeOf(context).height * .1),
                const AdDetailsButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}
