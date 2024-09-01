import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/models/categories.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTap extends StatelessWidget {
  const CustomTap({super.key, required this.categories});

  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(21),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Center(
        child:  Text(
          context.tr(categories.title),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
