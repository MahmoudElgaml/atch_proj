import 'package:animations/animations.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/widgets/reach_us_dialog.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class MessageButton extends StatelessWidget {
  const MessageButton(
      {super.key,
      required this.number,
      required this.locations,
      required this.phones});

  final String? number;
  final Map<String, dynamic> locations;
  final List<String> phones;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModal(
          configuration: const FadeScaleTransitionConfiguration(
              transitionDuration: Duration(milliseconds: 500)),
          context: context,
          builder: (context) {
            return ReachUsDialog(
              number: number,
              locations: locations,
              phones: phones,
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 19),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1.50,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: AppColor.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.contact_support,
              size: 25,
              color: AppColor.primaryColor,
            ),
            const Gap(10),
            Text(
              "reach us",
              style: AppStyle.style16Bold(context)
                  .copyWith(color: AppColor.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
