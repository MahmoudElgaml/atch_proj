import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/widget/ad_details_fist_section.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'ad_details_button.dart';
import 'ad_details_location_widget.dart';
import 'add_detail_widget.dart';

class AdDetailsSection extends StatelessWidget {
  const AdDetailsSection({super.key, required this.campaign});

  final DetailCampaigns? campaign;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .35,
              child: AdDetailsFistSection(campaign: campaign),
            ),
            const Gap(30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    campaign?.description ?? "",
                    style: AppStyle.style24Regular(context).copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                const Gap(20),
                AdDetailsWidget(
                  isProfile: false,
                  image: Assets.imagesDate,
                  first: campaign?.startDate,
                  last: campaign?.endDate,
                ),
                const Gap(25),
                AdDetailsLocationWidget(
                    Assets.imagesLocation, campaign?.locations ?? []),
                const Gap(25),
                InkWell(
                  onTap: () => context.push(AppRoute.advertiserInfoPage,
                      extra: campaign?.advertiser),
                  child: AdDetailsWidget(
                    isProfile: true,
                    imageAdvertise: campaign?.advertiser?.profilePic ?? "",
                    first: campaign?.advertiser?.name,
                    last: "Advertiser",
                  ),
                ),
                const Gap(25),
                Text(
                  "Videos:",
                  style: AppStyle.style24Regular(context),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(10),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Linkify(
                        text: campaign?.videos?[index] ?? "",
                        style: AppStyle.style24Regular(context),
                      ),
                    ),
                    itemCount: campaign?.videos?.length ?? 0,
                  ),
                ),
                const Center(child: AdDetailsButton())
              ],
            )
          ],
        ),
      ),
    );
  }
}
