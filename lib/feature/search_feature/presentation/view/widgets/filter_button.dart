import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryColor,
      ),

      padding: const EdgeInsets.all(6),
      width: 75,
      height: 30,
      child: Center(
        child: Text(
          "Filter",
          style:
              AppStyle.style14ExtraBold(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
