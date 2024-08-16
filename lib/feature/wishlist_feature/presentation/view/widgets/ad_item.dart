import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdItem extends StatelessWidget {
  const AdItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 370,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.imagesJazz),
          Gap(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1st MAY-SAT-2.00 PM",
                style: AppStyle.style13(context)
                    .copyWith(color: AppColor.primaryColor),
              ),
              Gap(5),
              Text(
                "A virtual evening of smooth jazz",
                style: AppStyle.style13(context)
                    .copyWith(color: AppColor.fontColor, fontSize: 16),
              )
            ],
          ),
          Icon(Icons.favorite_border)
        ],
      ),
    );
  }
}
