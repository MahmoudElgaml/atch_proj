import 'package:flutter/material.dart';

class TabsAppBar extends StatefulWidget {
  const TabsAppBar({super.key});

  @override
  State<TabsAppBar> createState() => _TabsAppBarState();
}

class _TabsAppBarState extends State<TabsAppBar> {
  int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        DefaultTabController(
            length: 3,
            child: TabBar(
              onTap: (index) {
                selectedindex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: const [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ))
      ],
    );;
  }
}
