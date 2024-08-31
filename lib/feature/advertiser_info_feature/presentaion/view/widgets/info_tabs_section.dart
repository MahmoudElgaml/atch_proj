import 'package:atch_proj/feature/account_feature/page/account_screen.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'advertise_campignes_list.dart';

class InfoTabsSection extends StatelessWidget {
  const InfoTabsSection(
      {super.key, required this.advInfoCubit, required this.advertiser});

  final DetailAdvertiser advertiser;
  final AdvInfoCubit advInfoCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .53,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const CustomTabsWidget(),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBarView(
                      children: [
                        Text(
                          advertiser.about ?? "",
                          style: AppStyle.style16Regular(context),
                        ),
                        AdvertiseCampaignsList(
                          advId: advertiser.id,
                          advInfoCubit: advInfoCubit,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTabsWidget extends StatelessWidget {
  const CustomTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          child: Text(
            context.tr("about"),
          ),
        ),
        Tab(
          child: Text(
            context.tr("campaigns"),
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
