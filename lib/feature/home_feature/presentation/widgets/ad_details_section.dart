import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ad_details_button.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ad_details_fist_section.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ad_details_widget.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdDetailsSection extends StatelessWidget {
  const AdDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdDetailsFistSection(),
        Gap(30),
        Center(
          child: Text(
            "فراشة الحج اشرف",
            style: AppStyle.style34(context)
                .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
        Gap(50),
        AdDetailsWidget(
            Assets.imagesDate, "14 December,2021", "Tuesday 4:00PM "),
        Gap(25),
        AdDetailsWidget(
            Assets.imagesLocation, "Gala Convention Center", "36 Faisal st"),
        Gap(25),
        AdDetailsWidget(Assets.imagesProfileTest, "Ashfak Sayem", "Organizer"),
        Gap(200),
        AdDetailsButton()
      ],
    );
  }
}
