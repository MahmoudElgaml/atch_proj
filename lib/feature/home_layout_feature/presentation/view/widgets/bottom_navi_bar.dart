import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/view/widgets/bottom_navi_item.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2000),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            backgroundColor: AppColor.PrimaryColor,
            onTap: (value) {
              HomeLayoutCubit.get(context).viewTap(value);
              setState(() {
                selectedIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColor.PrimaryColor,
                icon: BottomNaviItem(
                    icon: Icons.home_outlined, isSelected: selectedIndex == 0),
                label: context.tr("navHome"),
              ),
              BottomNavigationBarItem(
                icon: BottomNaviItem(
                    icon: Icons.search_outlined,
                    isSelected: selectedIndex == 1),
                label: context.tr("navSearch"),
              ),
              BottomNavigationBarItem(
                icon: BottomNaviItem(
                    icon: Icons.favorite_border,
                    isSelected: selectedIndex == 2),
                label: context.tr("navWishList"),
              ),
              BottomNavigationBarItem(
                icon: BottomNaviItem(
                    icon: Icons.account_circle_outlined,
                    isSelected: selectedIndex == 3),
                label: context.tr("navAccount"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
