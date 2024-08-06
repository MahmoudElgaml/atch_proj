import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/all_campain.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/bottom_navi_bar.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/custom_app_bar.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/drawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../home_feature/presentation/view/home_screen.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: const HomeDrawer(),
        body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
          builder: (context, state) {
           //polymorphism
            return state.viewTap();
          },
        ),
        bottomNavigationBar: const BottomNaviBar()
    );
  }
}
