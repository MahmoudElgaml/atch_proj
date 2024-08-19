import 'package:atch_proj/feature/home_feature/presentation/manager/get_normal_campagin_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/popular_ads.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/popular_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_style.dart';

class AllAds extends StatelessWidget {
  const AllAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Advertises",
            style: AppStyle.style26(context),
          ),
          const Gap(17),
          BlocBuilder<GetNormalCampaginCubit, GetNormalCampaginState>(
            builder: (context, state) {
              if (state is GetNormalCampaginFailState) {
                return Center(
                  child: Text(state.mesage),
                );
              } else if (state is GetNormalCampaginSuccessState) {
                var campaigns =
                    GetNormalCampaginCubit.get(context).popularCampaign;
                return SizedBox(
                  height: 250,
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
      ),
    );
  }
}
