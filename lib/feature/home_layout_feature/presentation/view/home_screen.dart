import 'package:animations/animations.dart';
import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/bottom_navi_bar.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/service_locator/config.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const HomeDrawer(),
        body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          builder: (context, state) {
            //polymorphism
            return PageTransitionSwitcher(
              duration: const Duration(seconds: 1),
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                return FadeThroughTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: state.viewTap(),
            );

          },
        ),
        bottomNavigationBar: const BottomNaviBar(),
        floatingActionButton: getIt<HiveManager>()
                    .retrieveSingleData<Person>(HiveKeys.userBox)
                    ?.role ==
                "advertiser"
            ? FloatingActionButton(
                backgroundColor: AppColor.buttonColor,
                onPressed: () {
                  context.push(AppRoute.addCampaign);
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : null
    );
  }
}
