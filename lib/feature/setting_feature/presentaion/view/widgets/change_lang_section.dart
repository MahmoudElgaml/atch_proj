import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../auth_feature/auth/presentation/widgets/custom_drop_menu.dart';

class ChangeLangSection extends StatelessWidget {
  const ChangeLangSection({super.key});

  static const List<String> items = ["Arabic", "English"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr("lang"),
          style: AppStyle.style18Regular(context),
        ),
        const Gap(10),
        CustomDropMenu(
          isLang: true,
          items: Map.fromIterable(items),
          selectedValue:
          context.locale.toString() == "ar" ? "Arabic" : "English",
          isAuth: false,
          setValue: (value) {},
        )
      ],
    );
  }
}