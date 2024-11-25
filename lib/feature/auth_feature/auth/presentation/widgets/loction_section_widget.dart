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
      children: [
        Row(
          children: [
            Expanded(
              child: CostumeTextFiled(
                validator: (value) =>
                    ValidationService.validateEmpty(value, "Your Location"),
                title: "FirstLocation",
                textEditingController: location1,
              ),
            ),
            const Gap(10),
            Expanded(
              child: CostumeTextFiled(
                validator: (value) =>
                    AuthCubit.get(context).validateOnLocationLink(
                  link: value ?? "",
                  isLocation1: true,
                  location1: location1.text,
                ),
                title: "LinkForLocation",
                textEditingController: location1Link,
              ),
            ),
          ],
        ),
        const Gap(25),
        Row(
          children: [
            Expanded(
              child: CostumeTextFiled(
                title: "SeconedLocation",
                textEditingController: location2,
              ),
            ),
            const Gap(10),
            Expanded(
              child: CostumeTextFiled(
                validator: (value) =>
                    AuthCubit.get(context).validateOnLocationLink(
                  link: value ?? "",
                  isLocation1: false,
                  location2: location2.text,
                ),
                title: "LinkForLocation",
                textEditingController: location2Link,
              ),
            ),
          ],
        )
      ],
    );
  }
}
