import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/view/widgets/adv-campiagn_list.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/custom_tabs_widget.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/view/wishListScreen.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
        AdvertiseAccountTaps(),
      ],
    );
  }
}

class AdvertiseAccountTaps extends StatelessWidget {
  const AdvertiseAccountTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .43,
      child: DefaultTabController(
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
                              advertiseCampaigns:
                                  advertiserInfo?.campaigns ?? [])
                        ],
                      );
                    }
                    return const WishListLoadingWidget();
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
