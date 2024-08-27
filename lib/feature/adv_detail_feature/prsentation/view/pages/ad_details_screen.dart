import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/manager/get_detail_campaign_cubit.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../widget/ad_details_section.dart';

class AdDetailsScreen extends StatelessWidget {
  const AdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int? campaignId = GoRouterState.of(context).extra! as int?;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Detail",
          style: AppStyle.style24Regular(context),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            getIt<GetDetailCampaignCubit>()..getCampaignDetail(campaignId!),
        child: BlocBuilder<GetDetailCampaignCubit, GetDetailCampaignState>(
          builder: (context, state) {
            if (state is GetDetailCampaignFailState) {
              return Center(
                child: Text(
                  state.message,
                ),
              );
            } else if (state is GetDetailCampaignSuccessState) {
              return AdDetailsSection(
                campaign: GetDetailCampaignCubit.get(context)
                    .detailCampaignModel
                    ?.campaigns,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
