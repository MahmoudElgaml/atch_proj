import 'package:atch_proj/feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/campaign_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';


class AdvertiseCampaignsList extends StatelessWidget {
  const AdvertiseCampaignsList({super.key, required this.advId,});

  final num? advId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvInfoCubit, AdvInfoState>(
      builder: (context, state) {
        if (state is AdvInfoFailState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is AdvInfoSuccessState) {
          var advCampaigns = AdvInfoCubit.get(context).advCampaigns;
          return ListView.separated(
            itemBuilder: (context, index) => CampaignItem(
              campaigns: advCampaigns[index],
            ),
            separatorBuilder: (context, index) => const Gap(10),
            itemCount: advCampaigns.length,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

