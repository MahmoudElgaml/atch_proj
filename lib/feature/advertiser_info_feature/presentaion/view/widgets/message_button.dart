
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class MessageButton extends StatelessWidget {
  const MessageButton({super.key, required this.number});

  final String? number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        lunchWhats(number ?? "");
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
              Icons.edit,
              size: 25,
              color: AppColor.primaryColor,
            ),
            const Gap(10),
            Text(
              "Message",
              style: AppStyle.style16Bold(context)
                  .copyWith(color: AppColor.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> lunchWhats(String number) async {
  String contact = number;
  String text = 'hello';
  String androidUrl = "whatsapp://send?phone=$contact&text=$text";

  try {
    if (await canLaunchUrl(Uri.parse(Uri.encodeFull(androidUrl)))) {
      await launchUrl(Uri.parse(Uri.encodeFull(androidUrl)));
    }
  } catch (e) {
    print('object');
  }
}
