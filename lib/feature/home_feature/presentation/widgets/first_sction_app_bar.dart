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
      ],
    );
  }
}
