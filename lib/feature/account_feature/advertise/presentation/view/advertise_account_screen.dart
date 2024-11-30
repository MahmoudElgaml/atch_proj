import 'package:atch_proj/core/utils/components/loading_rectangle.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/view/widgets/adv-campiagn_list.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/campaign_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../advertiser_info_feature/presentaion/view/widgets/info_tabs_section.dart';
import '../../../page/widgets/account_first_section.dart';

class AdvertiseAccountScreen extends StatelessWidget {
  const AdvertiseAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          flex: 2,
          child: AccountFirstSection(),
        ),
        Expanded(
          flex: 3,
          child: AdvertiseAccountTaps(),
        ),
      ],
    );
  }
}

class AdvertiseAccountTaps extends StatelessWidget {
  const AdvertiseAccountTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const CustomTabsWidget(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<AdvertiseInfoCubit, AdvertiseInfoState>(
                buildWhen: (previous, current) =>
                    current is AdvertiseAccountSuccessState ||
                    current is AdvertiseAccountFailState ||
                    current is AdvertiseAccountDeleteCampaignSuccessState ||
                    current is AdvertiseAccountLoadingState,
                listener: (context, state) {
                  if (state is AdvertiseAccountDeleteCampaignSuccessState) {
                    AdvertiseInfoCubit.get(context).getAdvertiseInfo();
                  }
                },
                builder: (context, state) {
                  if (state is AdvertiseAccountFailState) {
                    return Center(
                      child: Text(
                        state.message,
                      ),
                    );
                  } else if (state is AdvertiseAccountSuccessState) {
                    var advertiserInfo =
                        AdvertiseInfoCubit.get(context).advertiseInfoModel;
                    return TabBarView(
                      children: [
                        Text(advertiserInfo?.advertiser?.about ?? "",
                            style: AppStyle.style16Bold(context)),
                        AdvAccountCampaignList(
                          advertiseCampaigns: advertiserInfo?.campaigns ?? [],
                        ),
                        const AdvertiseAccountUnApproveBuilder(),
                      ],
                    );
                  }
                  return const LoadingRectangleComponent();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AdvertiseAccountUnApprovedCampaignList extends StatelessWidget {
  const AdvertiseAccountUnApprovedCampaignList(
      {super.key, required this.unApprovedCampaigns});

  final List<Campaigns>? unApprovedCampaigns;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CampaignItem(
        campaigns: unApprovedCampaigns![index],
      ),
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: unApprovedCampaigns?.length ?? 0,
    );
  }
}

class AdvertiseAccountUnApproveBuilder extends StatelessWidget {
  const AdvertiseAccountUnApproveBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertiseInfoCubit, AdvertiseInfoState>(
      buildWhen: (previous, current) =>
          current is AdvertiseAccountGetUnApproveSuccessState ||
          current is AdvertiseAccountGetUnApproveFailState ||
          current is AdvertiseAccountGetUnApproveLoadingState ||
          previous is AdvertiseAccountGetUnApproveSuccessState ||
          previous is AdvertiseAccountGetUnApproveFailState ||
          previous is AdvertiseAccountGetUnApproveLoadingState,
      builder: (context, state) {
        if (state is AdvertiseAccountGetUnApproveSuccessState) {
          return AdvertiseAccountUnApprovedCampaignList(
            unApprovedCampaigns: state.campaignModel.campaigns,
          );
        } else if (state is AdvertiseAccountGetUnApproveFailState) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else {
          return const LoadingRectangleComponent();
        }
      },
    );
  }
}
