import 'package:atch_proj/feature/home_feature/presentation/manager/get_normal_campagin_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/no_offer_ads_item.dart';
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
    return BlocBuilder<GetNormalCampaignCubit, GetNormalCampaignState>(
      builder: (context, state) {
        if (state is GetNormalCampaignFailState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is GetNormalCampaignSuccessState) {
          var campaigns = GetNormalCampaignCubit.get(context).popularCampaign;
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 167 / 240,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) => NoOfferAdsItem(
                campaigns: campaigns[index],
              ),
              itemCount: campaigns.length,
              scrollDirection: Axis.vertical,
            ),
          );
        }
        return const PopularAdsLoading();
      },
    );
  }
}
