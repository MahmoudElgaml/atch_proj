import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/manager/recently_viewed_cubit.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/manager/used_offer_cubit.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/view/widget/account_first_section.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/view/widget/account_tabs_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../generated/assets.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var recentlyViewedCubit = getIt<RecentlyViewedCubit>()..getRecentlyView();
    var usedOfferCubit = getIt<UsedOfferCubit>()..getUsedOffer();
    return Column(
      children: [
        const AccountFirstSection(),
        AccountTabsSection(
          usedOfferCubit: usedOfferCubit,
          recentlyViewedCubit: recentlyViewedCubit,
        ),
      ],
    );
  }
}
