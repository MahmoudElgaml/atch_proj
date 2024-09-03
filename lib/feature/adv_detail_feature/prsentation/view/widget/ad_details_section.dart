import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/services/rectangle_shimmer.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/widget/ad_detail_video_section.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/widget/ad_details_fist_section.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/manger/qr_offer_cubit.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/service_locator/config.dart';
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
                    last: context.tr("AdvTitle"),
                  ),
                ),
                const Gap(25),
                AdDetailVideoSection(
                   campaignId: campaign?.id,
                  videos: campaign?.videos,
                ),
                BlocProvider(
                  create: (context) => getIt<QrOfferCubit>(),
                  child: Center(
                    child: AdDetailsButton(
                      campaignId: campaign?.id,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
