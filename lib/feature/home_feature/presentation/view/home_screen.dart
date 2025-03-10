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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAppBar(),
        Gap(17),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TabsAppBar(),
                Gap(17),
                PopularAds(),
                Gap(17),
                AllAds(),
                Gap(20),
              ],
            ),
          ),
        )
      ],
    );
  }
}
