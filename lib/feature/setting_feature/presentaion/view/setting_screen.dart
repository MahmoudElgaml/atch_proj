import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/widget/ad_detail_video_section.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/custom_drop_menu.dart';
import 'package:atch_proj/feature/setting_feature/presentaion/view/widgets/change_lang_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr("setting")),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangeLangSection()
          ],
        ),
      ),
    );
  }
}


