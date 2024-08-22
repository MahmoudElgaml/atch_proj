import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/advertise_campignes_list.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/custom_tabs_widget.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/info_section.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/info_tabs_section.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/campaign_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/service_locator/config.dart';
import '../../../../generated/assets.dart';

class AdvertiserInfoPage extends StatelessWidget {
  const AdvertiserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailAdvertiser advertiser =
        GoRouterState.of(context).extra! as DetailAdvertiser;
    AdvInfoCubit advInfoCubit = getIt<AdvInfoCubit>()
      ..getAdvCampaigns(advertiser.id);
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
                advInfoCubit: advInfoCubit,
                advertiser: advertiser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
