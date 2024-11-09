import 'package:atch_proj/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class BottomNaviItem extends StatelessWidget {
  const BottomNaviItem(
      {super.key, required this.icon, required this.isSelected});

  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child:
          Icon(icon, color: isSelected ? AppColor.PrimaryColor : Colors.white),
    );
  }
}
