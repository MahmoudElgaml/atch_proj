import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/custom_tabs_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../search_feature/presentation/view/widgets/campaign_item.dart';
import '../../../user/presentation/view/widget/account_first_section.dart';

class AdvertiseAccountScreen extends StatelessWidget {
  const AdvertiseAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AccountFirstSection(),
        AdvertiseAccountTaps()


      ],


    );
  }
}

class AdvertiseAccountTaps extends StatelessWidget {
  const AdvertiseAccountTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .sizeOf(context)
          .height * .43,
      child:  DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const CustomTabsWidget(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<AdvertiseInfoCubit, AdvertiseInfoState>(
                  builder: (context, state) {
                    if (state is AdvertiseAccountFailState) {
                      return Center(child: Text(state.message,),);
                    }
                    else if (state is AdvertiseAccountSuccessState) {
                      var advertiserInfo=AdvertiseInfoCubit.get(context).advertiseInfoModel;
                      return  TabBarView(
                        children: [
                          Text(advertiserInfo?.advertiser?.about??"",style: AppStyle.style16Bold(context)),
                          AdvAccountCampaignList(advertiseCampaigns:advertiserInfo?.campaigns??[] )
                        ],
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AdvAccountCampaignList extends StatelessWidget {
  const AdvAccountCampaignList({super.key, required this.advertiseCampaigns});

  final List<AdvertiseCampaigns> advertiseCampaigns;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          AdvAccountCampaignItem(campaigns: advertiseCampaigns[index],),
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: advertiseCampaigns.length,
    );
  }
}

class AdvAccountCampaignItem extends StatelessWidget {
  const AdvAccountCampaignItem({super.key, required this.campaigns});

  final AdvertiseCampaigns campaigns;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.white24,
      color: Colors.white24,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 92,
                width: 79,
                child: AspectRatio(
                  aspectRatio: 79 / 92,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: campaigns.images!.isEmpty
                          ? ""
                          : campaigns.images?[0] ?? "",
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => const Text("error"),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(18),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    campaigns.endDate?.substring(0, 16) ?? " No Date",
                    style: AppStyle.style18Regular(context),
                  ),
                  Text(
                    campaigns.campaignName ?? "",
                    style: AppStyle.style18(context),
                  ),
                  const Gap(7),
                  FittedBox(
                    child: SizedBox(
                      width: 170,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        campaigns.description ?? "",
                        maxLines: 2,
                        style: AppStyle.style18(context),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





