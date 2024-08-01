
import 'package:atch_proj/feature/home_feature/presentation/view/widgets/custom_app_bar.dart';
import 'package:atch_proj/feature/home_feature/presentation/view/widgets/tabs_app_bar.dart';

import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
              alignment: Alignment.bottomCenter,
              children: [CustomAppBar(), TabsAppBar()]),
        ],

    final UserData name = GoRouterState.of(context).extra! as UserData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Text(name.user!.name??""),

      ),
    );
  }
}
