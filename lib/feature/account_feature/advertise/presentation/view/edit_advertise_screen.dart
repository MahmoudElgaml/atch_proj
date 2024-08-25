import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/cache/hive/hive_manager.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/service_locator/config.dart';
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
  TextEditingController about = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Advertiser advertiser =
        GoRouterState.of(context).extra! as Advertiser;
    setData(advertiser);
    return Column(
      children: [
        const Gap(10),
        const TestUploadImage(
          isEdit: true,
        ),
        const Gap(25),
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
          maxLine: 3,
          title: "about",
          textEditingController: about,
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
            onPressed: () {



            },
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

  setData(Advertiser advertiser) {
    companyName.text = advertiser.name ?? "";
    email.text = advertiser.email ?? "";
    username.text = advertiser.name ?? "";
    location.text = advertiser.locations?[0] ?? "";
    phone.text = advertiser.phones?[0] ?? "";
    about.text=advertiser.about??"";
  }
}
