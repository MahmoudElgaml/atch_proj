import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({super.key});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (value) {
        HomeLayoutCubit.get(context).viewTap(value);
        setState(() {
          selectedIndex = value;
        });
      },
      unselectedLabelStyle: const TextStyle(fontSize: 14),
      showUnselectedLabels: true,
      unselectedItemColor: const Color(0xff72757E),
      selectedItemColor: const Color(0xff5669FF),
      showSelectedLabels: true,
      items:  [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined, size: 30),
          label:context.tr("navHome") ,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.manage_search, size: 30),
          label: context.tr("navSearch"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_outline, size: 30),
          label: context.tr("navWishList"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person, size: 30),
          label: context.tr("navAccount"),
        ),
      ],
    );
  }
}
