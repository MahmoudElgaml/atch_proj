import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/presentation/manager/get_popular_campaign_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/popular_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PopularAds extends StatelessWidget {
  const PopularAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "popular Advertises",
            style: AppStyle.style26(context),
          ),
          const Gap(17),
          BlocBuilder<GetPopularCampaignCubit, GetPopularCampaignState>(
            builder: (context, state) {
              if (state is GetPopularCampaignFailureState) {
                return Center(child: Text(state.message));
              } else if (state is GetPopularCampaignSuccessState) {
                var popularCampaigns =
                    GetPopularCampaignCubit.get(context).popularCampaign;
                return SizedBox(
                  height: 250,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(10),
                    itemBuilder: (context, index) => AspectRatio(
                      aspectRatio: 237/255,
                        child: AdsItem(
                      campaigns: popularCampaigns[index],
                    )),
                    itemCount: popularCampaigns.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
