import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/validation_service.dart';
import 'costume_text_filed.dart';

class LocationSectionWidget extends StatelessWidget {
  const LocationSectionWidget({
    super.key,
    required this.location1,
    required this.location1Link,
    required this.location2,
    required this.location2Link,
  });

  final TextEditingController location1;
  final TextEditingController location1Link;
  final TextEditingController location2;
  final TextEditingController location2Link;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Location1", style: AppStyle.style21Medium(context)),
        const Gap(5),
        SizedBox(
          width: 200,
          child: CostumeTextFiled(
            withoutLabel: false,
            validator: (value) =>
                ValidationService.validateEmpty(value, "Your Location"),
            title: "location name",
            withoutTitle: true,
            textEditingController: location1,
          ),
        ),
        const Gap(10),
        CostumeTextFiled(
          withoutLabel: false,
          validator: (value) => AuthCubit.get(context).validateOnLocationLink(
            link: value ?? "",
            isLocation1: true,
            location1: location1.text,
          ),
          title: "Link For Location",
          withoutTitle: true,
          textEditingController: location1Link,
        ),
        const Gap(11),
        Text(
          "Location2",
          style: AppStyle.style21Medium(context),
        ),
        const Gap(5),
        SizedBox(
          width: 200,
          child: CostumeTextFiled(
            withoutLabel: false,
            withoutTitle: true,
            title: "location name",
            textEditingController: location2,
          ),
        ),
        const Gap(10),
        CostumeTextFiled(
          withoutLabel: false,
          withoutTitle: true,
          validator: (value) => AuthCubit.get(context).validateOnLocationLink(
            link: value ?? "",
            isLocation1: false,
            location2: location2.text,
          ),
          title: "Link For Location",
          textEditingController: location2Link,
        ),
      ],
    );
  }
}
