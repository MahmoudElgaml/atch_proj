import 'package:atch_proj/feature/home_feature/presentation/manager/get_normal_campagin_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/popular_ads.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/popular_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_style.dart';

class AllAds extends StatelessWidget {
  const AllAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("All"),
          style: AppStyle.style26(context),
        ),
        const Gap(17),
        BlocBuilder<GetNormalCampaignCubit, GetNormalCampaignState>(
          builder: (context, state) {
            if (state is GetNormalCampaignFailState) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is GetNormalCampaignSuccessState) {
              var campaigns =
                  GetNormalCampaignCubit.get(context).popularCampaign;
              return SizedBox(
                height: 300,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(10),
                  itemBuilder: (context, index) => AdsItem(
                    campaigns: campaigns[index],
                  ),
                  itemCount: campaigns.length,
                  scrollDirection: Axis.horizontal,
                ),
              );
            }
            return const PopularAdsLoading();
          },
        ),
      ],
    );
  }
}
