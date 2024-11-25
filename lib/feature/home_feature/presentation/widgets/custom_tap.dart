import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/models/categories.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTap extends StatelessWidget {
  const CustomTap(
      {super.key, required this.categories, required this.isSelected});

  final Categories categories;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColor.PrimaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: AppColor.PrimaryColor,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          context.tr(categories.title),
          style: AppStyle.style14Regular(context).copyWith(
            color: isSelected ? Colors.white : AppColor.PrimaryColor,
          ),
        ),
      ),
    );
  }
}
