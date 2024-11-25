import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/home_layout_feature/data/model/contact_us_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/assets.dart';

class ContactUsDialog extends StatelessWidget {
  const ContactUsDialog({super.key});

  static const List<ContactUsModel> items = ContactUsModel.values;

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
            const Gap(7),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: items
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              e.icon == Assets.imagesWhatsIcon
                                  ? Helper.lunchWhatsapp(e.link)
                                  : Helper.lunchUUrl(e.link);
                            },
                            child: SvgPicture.asset(
                              e.icon,
                              width: 40,
                              height: 40,
                            )),
                      ),
                    )
                    .toList(),
              ),
            ),
            Text(
              "Our Emails",
              style: AppStyle.style18Regular(context),
            ),
            const Gap(7),
            SelectableText("Greateagle2030@gmail.com",
                style: AppStyle.style16Regular(context))
          ],
        ),
      ),
    );
  }
}
