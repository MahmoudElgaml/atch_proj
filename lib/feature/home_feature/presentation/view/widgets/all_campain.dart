import 'package:atch_proj/feature/home_feature/presentation/view/widgets/popular_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';

class AllAds extends StatelessWidget {
  const AllAds({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Advertises",
            style: AppStyle.style26(context),
          ),
          const Gap(17),
          SizedBox(
            height: 250,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Gap(10),
              itemBuilder: (context, index) => const AdsItem(),
              itemCount: 20,

              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
