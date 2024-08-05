import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/presentation/view/widgets/popular_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PopularAds extends StatelessWidget {
  const PopularAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "popular ads",
            style: AppStyle.style26(context),
          ),
          const Gap(17),
          SizedBox(
            height: 250,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Gap(10),
              itemBuilder: (context, index) => const PopularItem(),
              itemCount: 20,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
