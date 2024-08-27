import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/models/categories.dart';
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
        child: Text(
          categories.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
