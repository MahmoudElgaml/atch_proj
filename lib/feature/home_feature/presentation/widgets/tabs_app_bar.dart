import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/models/categories.dart';
import 'package:atch_proj/feature/home_feature/presentation/manager/get_normal_campagin_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/manager/get_popular_campaign_cubit.dart';

import 'package:flutter/material.dart';

import 'custom_tap.dart';

class TabsAppBar extends StatefulWidget {
  const TabsAppBar({super.key});

  @override
  State<TabsAppBar> createState() => _TabsAppBarState();
}

class _TabsAppBarState extends State<TabsAppBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Categories> category = Categories.values.toList();
    return Column(
      children: [
        DefaultTabController(
          length: category.length,
          child: TabBar(
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.center,
              onTap: (index) {
                if(selectedIndex==index){
                }
                else{
                  GetNormalCampaginCubit.get(context)
                      .getNormalCampaign(category[index].title);
                  GetPopularCampaignCubit.get(context).getPopularCampaign(category[index].title);
                  selectedIndex=index;
                }

              },
              isScrollable: true,
              indicatorColor: AppColor.primaryColor,
              tabs: category
                  .map(
                    (e) => CustomTap(
                      categories: e,
                    ),
                  )
                  .toList()),
        )
      ],
    );
  }
}
