import 'package:atch_proj/feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import 'advertise_campignes_list.dart';
import 'custom_tabs_widget.dart';

class InfoTabsSection extends StatelessWidget {
  const InfoTabsSection({super.key,required this.advInfoCubit,required this.advertiser});
final  Advertiser advertiser;
final AdvInfoCubit advInfoCubit;
  @override
  Widget build(BuildContext context) {
    return   Expanded(
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
