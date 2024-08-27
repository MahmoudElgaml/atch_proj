import 'package:atch_proj/core/utils/models/categories.dart';

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
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,

              indicatorColor: Colors.transparent,
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
