import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/info_section.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/info_tabs_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/service_locator/config.dart';

class AdvertiserInfoPage extends StatelessWidget {
  const AdvertiserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailAdvertiser advertiser =
        GoRouterState.of(context).extra! as DetailAdvertiser;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InfoSection(
                advertiser: advertiser,
              ),
              InfoTabsSection(
                advertiser: advertiser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
