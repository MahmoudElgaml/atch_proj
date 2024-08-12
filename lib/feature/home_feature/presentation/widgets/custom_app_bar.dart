import 'package:atch_proj/core/utils/app_color.dart';

import 'package:atch_proj/feature/search_feature/presentation/view/widgets/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'first_sction_app_bar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),

      decoration: const BoxDecoration(

        color: AppColor.appBarColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(33),
          bottomRight: Radius.circular(33),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: FirstSctionAppBar(),
          ),
          Gap(10),

        ],
      ),
    );
  }
}
