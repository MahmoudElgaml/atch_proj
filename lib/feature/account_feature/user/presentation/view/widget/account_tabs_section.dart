import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class AccountTabsSection extends StatelessWidget {
  const AccountTabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .40,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const AccountTabs(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  children: [
                    Text(
                      "Used offer",
                      style: AppStyle.style16Regular(context),
                    ),
                    Text(
                      "Recently Viewd",
                      style: AppStyle.style16Regular(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTabs extends StatelessWidget {
  const AccountTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(
          child: Text(
            "USED OFFERS",
          ),
        ),
        Tab(
          child: Text("RECENTLY VIEWED"),
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
