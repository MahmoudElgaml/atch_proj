import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';

import 'custom_drop_menu.dart';

class SelectBusinessSection extends StatefulWidget {
  const SelectBusinessSection({super.key});

  static const Map<String, String> items = {
    "Factory": "Factory",
    "Shop": "Shop",
    "Supermarket": "Supermarket",
    "Fashion": "Fashion",
    "Health & Beauty": "Health & Beauty",
    "Baby Products": "Baby Products",
    "Phones & Tablets": "Phones & Tablets",
    "Home & Furniture": "Home & Furniture",
    "Appliances": "Appliances",
    "Televisions & Audio": "Televisions & Audio",
    "Computing": "Computing",
    "Sporting Goods": "Sporting Goods",
    "Gaming": "Gaming",
    "Other": "Other",
  };

  @override
  State<SelectBusinessSection> createState() => _SelectBusinessSectionState();
}

class _SelectBusinessSectionState extends State<SelectBusinessSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Business",
          style: AppStyle.style21Medium(context),
        ),
        const Gap(5),
        CustomDropMenu(
          items: SelectBusinessSection.items,
          selectedValue: AuthCubit.get(context).selectedValue,
          isAuth: false,
          setValue: (value) => AuthCubit.get(context).selectedValue = value,
        ),
      ],
    );
  }
}
