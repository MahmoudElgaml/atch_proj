import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/validation_service.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../auth_feature/auth/presentation/NewWidgets/custom_drop_menu.dart';
import '../../manager/add_campaign_cubit.dart';
import 'custom_camapaign_textfiled.dart';

class FirstForm extends StatelessWidget {
  const FirstForm({
    super.key,
    required this.companyName,
    required this.description,
  });

  final TextEditingController companyName;

  final TextEditingController description;

  static const Map<String, String> items = {
    "kids (1-3)": "Babies",
    "biggerKids (4-12)": "Kids",
    "teenagers(13-20)": "Teenagers",
    "adults(20-40)": "Adults",
    "elder(+40)": "Elder",
  };

  static List<String> locationMenu = ["First Location", "Seconed Location"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("companyName"),
              style: AppStyle.style21Regular(context),
            ),
            CustomCampaignTextFiled(
              validator: (value) => ValidationService.validateEmpty(
                value,
                "Company Name",
              ),
              hint: "ex: Great Eagle",
              textEditingController: companyName,
              maxLine: 1,
            ),
          ],
        ),
        const Gap(19),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("targetAudience"),
              style: AppStyle.style21Regular(context),
            ),
            const Gap(3),
            CustomDropMenu(
              setValue: (value) {
                AddCampaignCubit.get(context).selectedAudience = value;
              },
              items: items,
              selectedValue: AddCampaignCubit.get(context).selectedAudience,
              isAuth: false,
            ),
          ],
        ),
        const Gap(18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("location"),
              style: AppStyle.style21Regular(context),
            ),
            const Gap(3),
            CustomDropMenu(
              setValue: (value) {
                AddCampaignCubit.get(context).selectedLocation = value;
              },
              items: Map.fromIterable({}),
              selectedValue: AddCampaignCubit.get(context).selectedLocation,
              isAuth: false,
            ),
          ],
        ),
        const Gap(19),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("description"),
              style: AppStyle.style21Regular(context),
            ),
            const Gap(3),
            CustomCampaignTextFiled(
              validator: (value) =>
                  ValidationService.validateEmpty(value, "Description"),
              textEditingController: description,
              hint: "ex: we offer",
              maxLine: 6,
            ),
          ],
        ),
      ],
    );
  }
}
