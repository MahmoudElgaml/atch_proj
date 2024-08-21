import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../auth_feature/auth/presentation/pages/test_upload_image.dart';
import '../../../../auth_feature/auth/presentation/widgets/costume_text_filed.dart';

class AdvertiseEditScreen extends StatefulWidget {
  const AdvertiseEditScreen({super.key});

  @override
  State<AdvertiseEditScreen> createState() => _AdvertiseEditScreenState();
}

class _AdvertiseEditScreenState extends State<AdvertiseEditScreen> {
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController companyName = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        const TestUploadImage(
          isEdit: true,
        ),
        CostumeTextFiled(
          title: "Company Name",
          textEditingController: companyName,
        ),
        const Gap(25),
        CostumeTextFiled(
          title: "Advertise Name",
          textEditingController: username,
        ),
        const Gap(25),
        CostumeTextFiled(
          title: "Contact Email",
          textEditingController: email,
        ),
        const Gap(25),
        CostumeTextFiled(
          isPassword: true,
          title: "New password",
          textEditingController: password,
        ),
        const Gap(25),
        CostumeTextFiled(
          title: "AdvertisePhone",
          keyboardType: TextInputType.phone,
          textEditingController: phone,
        ),
        const Gap(25),
        CostumeTextFiled(
          title: "AdvertiseLocation",
          textEditingController: location,
        ),
        const Gap(25),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Update",
                style: AppStyle.style24Regular(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}