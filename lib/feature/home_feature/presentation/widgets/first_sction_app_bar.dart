import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class FirstSctionAppBar extends StatelessWidget {
  const FirstSctionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: Image.asset(AppImages.listIcon)),
        Column(
          children: [
            Row(
              children: [
                Text(
                  'Current Location',
                  style: AppStyle.style13(context)
                      .copyWith(color: Colors.white.withOpacity(.5)),
                ),
               const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 18,
                )
              ],
            ),
            Text(
              "Giza, Egypt",
              style: AppStyle.style13(context)
                  .copyWith(color: Colors.white.withOpacity(.7)),
            ),
          ],
        ),
        Image.asset(AppImages.notificationIcon),
      ],
    );
  }
}
