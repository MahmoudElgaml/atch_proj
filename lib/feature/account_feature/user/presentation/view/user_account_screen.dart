import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/view/widget/account_first_section.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/view/widget/account_tabs_section.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../generated/assets.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AccountFirstSection(),
        AccountTabsSection(),
      ],
    );
  }
}




