import 'package:atch_proj/feature/home_feature/presentation/view/widgets/custom_app_bar.dart';
import 'package:atch_proj/feature/home_feature/presentation/view/widgets/popular_ads.dart';
import 'package:atch_proj/feature/home_feature/presentation/view/widgets/tabs_app_bar.dart';

import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomAppBar(),
            ],
          ),
          Gap(13),
          PopularAds()

        ],
      ),
    );
  }
}
