import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class CustomTabsWidget extends StatelessWidget {
  const CustomTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(
          child: Text(
            "About",
          ),
        ),
        Tab(
          child: Text("campaigns"),
        ),
      ],
      dividerColor: AppColor.primaryColor,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelStyle: AppStyle.style16Regular(context),
      indicatorColor: AppColor.primaryColor,
    );
  }
}
