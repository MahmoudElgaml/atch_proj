import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/helper.dart';
import 'custom_date_time_text_filed.dart';

class DateSectionWidget extends StatelessWidget {
  const DateSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Start Date :",
              style: AppStyle.style24Regular(context),
            ),
            const Gap(10),
            Expanded(
              child: CustomDateTimeTextFiled(
                hintText: Helper.dateToString(DateTime.now()),
                icon: const Icon(Icons.date_range),
              ),
            ),
          ],
        ),
        const Gap(19),
        Row(
          children: [
            Text(
              "End Date :",
              style: AppStyle.style24Regular(context),
            ),
            const Gap(10),
            Expanded(
              child: CustomDateTimeTextFiled(
                hintText: Helper.dateToString(DateTime.now()),
                icon: const Icon(Icons.timer_outlined),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
