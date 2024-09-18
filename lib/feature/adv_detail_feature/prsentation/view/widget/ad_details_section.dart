import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/widget/ad_detail_video_section.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/widget/ad_details_fist_section.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/manger/qr_offer_cubit.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
                PriceSection(campaign: campaign),
                const Gap(20),
                AdDetailsWidget(
                  isProfile: false,
                  image: Assets.imagesDate,
                  first: campaign?.startDate,
                  last: campaign?.endDate,
                ),
                const Gap(25),
                AdDetailsLocationWidget(
                  Assets.imagesLocation,
                  campaign?.locations?.entries.toList() ?? [],
                ),
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

class PriceSection extends StatelessWidget {
  const PriceSection({super.key, required this.campaign});

  final DetailCampaigns? campaign;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipOval(
              child: Image.asset(
                Assets.imagesDollar,
                height: 48,
                width: 48,
              ),
            ),
            const Gap(25),
            Row(
              children: [
                Text(campaign?.offer?.toString() ?? "",
                    style: AppStyle.style18(context).copyWith(
                      color: AppColor.primaryColor,
                      fontSize: 20,
                    )),
                const Gap(7),
                Text(
                  campaign?.price.toString() ?? "",
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough, fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
