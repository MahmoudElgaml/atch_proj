import 'package:atch_proj/core/utils/components/loading_rectangle.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/view/widgets/adv-campiagn_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      length: 2,
      child: Column(
        children: [
          const CustomTabsWidget(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<AdvertiseInfoCubit, AdvertiseInfoState>(
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
                        )
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
