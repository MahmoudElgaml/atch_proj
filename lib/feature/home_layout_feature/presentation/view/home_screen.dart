
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/all_campain.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/bottom_navi_bar.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../home_feature/presentation/view/home_screen.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      drawer: Drawer(),
      body:HomeScreen(),
      bottomNavigationBar: BottomNaviBar()
    );
  }
}
