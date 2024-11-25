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
    return AspectRatio(
      aspectRatio: 345 / 336,
      child: AlertDialog(
        title: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Our Social Media",
                  style: AppStyle.style24Medium(context),
                ),
                const Gap(32),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Row(
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
                                    width: 60,
                                    height: 60,
                                  )),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Gap(37),
                Text(
                  "Our Emails",
                  style: AppStyle.style24Medium(context),
                ),
                const Gap(7),
                SelectableText("Greateagle2030@gmail.com",
                    style: AppStyle.style20Regular(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
