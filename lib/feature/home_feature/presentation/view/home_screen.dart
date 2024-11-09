import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_string.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/all_campain.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/popular_ads.dart';
import '../widgets/tabs_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(17),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildWelcomeSection(context),
                    const Gap(17),
                    const PopularAds(),
                    const Gap(17),
                    const AllAds(),
                    const Gap(20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildWelcomeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.welcome,
          style: AppStyle.style20Regular(context),
        ),
        Text(
          Helper.retrievePerson()?.name ?? "",
          style: AppStyle.style24Regular(context)
              .copyWith(color: AppColor.PrimaryColor),
        ),
      ],
    );
  }
}
