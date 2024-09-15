import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/assets.dart';

class ContactUsDialog extends StatelessWidget {
  const ContactUsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Our Social Media",
              style: AppStyle.style18Regular(context),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.imagesFacebookIcon),
                  const Gap(10),
                  SvgPicture.asset(Assets.imagesLinkedinIcon),
                  const Gap(10),
                  SvgPicture.asset(Assets.imagesWhatsIcon),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
