import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/components/save_button.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xff8c8c8c),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(Assets.imagesImageTest),
              ),
              const Gap(14),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "فراشة الحج اشرف بتحييكو",
                      style: AppStyle.style18(context),
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xff8c8c8c),
                        ),
                        Text(
                          "October City - Giza",
                          style: AppStyle.style18(context).copyWith(
                              color: const Color(0xff8c8c8c),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: SaveButton(),
          ),
        ],
      ),
    );
  }
}
