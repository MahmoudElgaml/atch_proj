import 'package:atch_proj/feature/home_feature/presentation/view/widgets/custom_app_bar.dart';
import 'package:atch_proj/feature/home_feature/presentation/view/widgets/tabs_app_bar.dart';
import 'package:flutter/material.dart';

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
      ),
    );
  }
}
