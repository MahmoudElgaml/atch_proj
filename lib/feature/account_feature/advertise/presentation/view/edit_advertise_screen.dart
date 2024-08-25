import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/cache/hive/hive_manager.dart';
import '../../../../../core/services/upload_image_service.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/service_locator/config.dart';
import '../../../../auth_feature/auth/presentation/pages/test_upload_image.dart';
import '../../../../auth_feature/auth/presentation/widgets/costume_text_filed.dart';
import '../../data/model/EditAdvertiseData.dart';

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
    return BlocListener<AdvertiseInfoCubit, AdvertiseInfoState>(
      listener: (context, state) async {
        if (state is AdvertiseAccountLoadingState) {
          EasyLoading.show();
        } else if (state is AdvertiseAccountFailState) {
          EasyLoading.dismiss();
          EasyLoading.showError("");
        } else if (state is AdvertiseAccountSuccessState) {
          await EasyLoading.showSuccess("");
          if (context.mounted) {
            context.go(AppRoute.logInKey);
          }

        }
      },
      child: Column(
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
                EditAdvertiseData advertise = EditAdvertiseData(

                  password: password.text,
                  username: username.text,
                  visa: "5050",
                  advertiserId: advertiser.id,
                  about: about.text,
                  advertiserLocations: [location.text],
                  advertiserPhones: [phone.text],
                  advertiserType: "Shop",
                  name: companyName.text,
                  email: email.text,
                );
                advertise.image = UploadImageService.imageFile;
                AdvertiseInfoCubit.get(context).editAdvertiser(advertise);
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
      ),
    );
  }

  setData(Advertiser advertiser) {
    companyName.text = advertiser.name ?? "";
    email.text = advertiser.email ?? "";
    username.text = advertiser.name ?? "";
    location.text = advertiser.locations?[0] ?? "";
    phone.text = advertiser.phones?[0] ?? "";
    about.text = advertiser.about ?? "";
  }
}
