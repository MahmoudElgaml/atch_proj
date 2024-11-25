import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/models/categories.dart';
import 'package:atch_proj/feature/home_feature/presentation/manager/get_normal_campagin_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/manager/get_popular_campaign_cubit.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_tap.dart';

class CategoryTaps extends StatefulWidget {
  const CategoryTaps({super.key});

  @override
  State<CategoryTaps> createState() => _TabsAppBarState();
}

class _TabsAppBarState extends State<CategoryTaps> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Explore",
            style: AppStyle.style14Medium(context),
          ),
          const Gap(7),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(100)),
                border: Border.all(color: AppColor.PrimaryColor, width: 1)),
            child: Text(
              "near me",
              style: AppStyle.style10Regular(context),
            ),
          ),
          const TabsCategory(),
        ],
      ),
    );
  }
}

class TabsCategory extends StatefulWidget {
  const TabsCategory({super.key});

  @override
  State<TabsCategory> createState() => _TabsCategoryState();
}

class _TabsCategoryState extends State<TabsCategory> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Categories> category = Categories.values.toList();
    return DefaultTabController(
      length: category.length,
      child: TabBar(
          padding: EdgeInsets.zero,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.center,
          labelPadding: const EdgeInsets.symmetric(horizontal: 6),
          onTap: (index) {
            if (selectedIndex == index) {
            } else {
              GetNormalCampaignCubit.get(context)
                  .getNormalCampaign(category[index].title);
              GetPopularCampaignCubit.get(context)
                  .getPopularCampaign(category[index].title);
              selectedIndex = index;
              setState(() {});
            }
          },
          isScrollable: true,
          indicatorColor: Colors.transparent,
          tabs: category
              .map(
                (e) => CustomTap(
                  isSelected: selectedIndex == category.indexOf(e),
                  categories: e,
                ),
              )
              .toList()),
    );
  }
}
