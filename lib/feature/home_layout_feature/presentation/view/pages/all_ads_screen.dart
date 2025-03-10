import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/components/loading_rectangle.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/drawer_cubit.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/campaign_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AllAdsScreen extends StatelessWidget {
  const AllAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Campaigns"),
      ),
      body: Column(
        children: [
          BlocBuilder<DrawerCubit, DrawerState>(
            bloc: DrawerCubit.get(context)..getAllCampaigns(),
            builder: (context, state) {
              if (state is DrawerGetCampaignsFailState) {
                return Center(
                  child: Text(
                    state.message,
                    style: AppStyle.style24Regular(context),
                  ),
                );
              } else if (state is DrawerGetCampaignsSuccessState) {
                return AllAdsList(
                  allCampaigns: state.allCampaigns,
                );
              }
              return Expanded(child: const LoadingRectangleComponent());
            },
          ),
        ],
      ),
    );
  }
}

class AllAdsList extends StatelessWidget {
  const AllAdsList({super.key, required this.allCampaigns});

  final List<Campaigns> allCampaigns;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: allCampaigns.length,
          itemBuilder: (context, index) {
            return CampaignItem(
              campaigns: allCampaigns[index],
            );
          },
        ),
      ),
    );
  }
}
