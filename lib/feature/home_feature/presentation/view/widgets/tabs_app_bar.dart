import 'package:atch_proj/core/utils/models/categories.dart';
import 'package:atch_proj/feature/home_feature/presentation/view/widgets/custom_tap.dart';
import 'package:flutter/material.dart';

class TabsAppBar extends StatefulWidget {
  const TabsAppBar({super.key});

  @override
  State<TabsAppBar> createState() => _TabsAppBarState();
}

class _TabsAppBarState extends State<TabsAppBar> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    List<Categories> category=Categories.values.toList();
    return  Column(
      children: [
        DefaultTabController(
            length: 3,
            child: TabBar(

              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.center,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: category.map((e) => CustomTap(categories: e),).toList()
            ))
      ],
    );;
  }
}
