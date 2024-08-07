import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ad_details_button.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ad_details_fist_section.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ad_details_widget.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdDetailsSection extends StatelessWidget {
  const AdDetailsSection({super.key, required this.campaign});

 final Campaigns campaign;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdDetailsFistSection(campaign:campaign),
        const Gap(30),
        Center(
          child: Text(
            campaign.campaignName??"",
            style: AppStyle.style34(context)
                .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
        const Gap(50),
        AdDetailsWidget(
            Assets.imagesDate, "14 December,2021", "Tuesday 4:00PM "),
        const Gap(25),
        AdDetailsWidget(
            Assets.imagesLocation, "Gala Convention Center", "36 Faisal st"),
        const Gap(25),
        AdDetailsWidget(Assets.imagesProfileTest, "Ashfak Sayem", "Organizer"),
        const Gap(200),
        const AdDetailsButton()
      ],
    );
  }
}
