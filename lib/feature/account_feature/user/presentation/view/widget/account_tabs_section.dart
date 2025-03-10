import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/components/loading_rectangle.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/manager/recently_viewed_cubit.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/manager/used_offer_cubit.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/campaign_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';


class AccountTabsSection extends StatelessWidget {
  const AccountTabsSection(
      {super.key,
      required this.recentlyViewedCubit,
      required this.usedOfferCubit});

  final RecentlyViewedCubit recentlyViewedCubit;
  final UsedOfferCubit usedOfferCubit;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const AccountTabs(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                children: [
                  UsedCampaignList(
                    usedOfferCubit: usedOfferCubit,
                  ),
                  RecentlyCampaignList(
                    recentlyViewedCubit: recentlyViewedCubit,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountTabs extends StatelessWidget {
  const AccountTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs:  [
        Tab(
          child: Text(
            context.tr("used"),
          ),
        ),
        Tab(
          child: Text(
           context.tr("recently"),
          ),
        ),
      ],
      dividerColor: AppColor.primaryColor,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelStyle: AppStyle.style16Regular(context),
      indicatorColor: AppColor.primaryColor,
    );
  }
}

class RecentlyCampaignList extends StatelessWidget {
  const RecentlyCampaignList({
    super.key,
    required this.recentlyViewedCubit,
  });

  final RecentlyViewedCubit recentlyViewedCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentlyViewedCubit, RecentlyViewedState>(
      bloc: recentlyViewedCubit,
      builder: (context, state) {
        if (state is RecentlyViewedFailState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is RecentlyViewedSuccessState) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) => CampaignItem(
              campaigns: state.campaigns[index],
            ),
            itemCount: state.campaigns.length,
          );
        }
        return const LoadingRectangleComponent();
      },
    );
  }
}

class UsedCampaignList extends StatelessWidget {
  const UsedCampaignList({
    super.key,
    required this.usedOfferCubit,
  });

  final UsedOfferCubit usedOfferCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsedOfferCubit, UsedOfferState>(
      bloc: usedOfferCubit,
      builder: (context, state) {
        if (state is UsedOfferFailState) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is UsedOfferSuccessState) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Gap(10),
            itemBuilder: (context, index) => CampaignItem(
              campaigns: state.campaigns[index],
            ),
            itemCount: state.campaigns.length,
          );
        }
        return const LoadingRectangleComponent();
      },
    );
  }
}
