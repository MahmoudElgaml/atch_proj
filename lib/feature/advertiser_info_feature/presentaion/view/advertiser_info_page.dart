import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/advertise_campignes_list.dart';
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
    final Advertiser advertiser =
        GoRouterState.of(context).extra! as Advertiser;
    AdvInfoCubit advInfoCubit = getIt<AdvInfoCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            width: double.infinity,
                            imageUrl: advertiser.advertiserPic ?? "",
                            errorWidget: (context, url, error) =>
                                Image.asset(Assets.assetsImagesEmptyImage),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .53,
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            tabs: const [
                              Tab(
                                child: Text(
                                  "About",
                                ),
                              ),
                              Tab(
                                child: Text("campaigns"),
                              ),
                            ],
                            dividerColor: AppColor.primaryColor,
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            labelStyle: AppStyle.style16Regular(context),
                            indicatorColor: AppColor.primaryColor,
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
