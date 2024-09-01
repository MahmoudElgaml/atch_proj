import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/services/validation_service.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/services/upload_image_service.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
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

  TextEditingController phone1 = TextEditingController();
  TextEditingController phone2 = TextEditingController();

  TextEditingController location1 = TextEditingController();
  TextEditingController location2 = TextEditingController();

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
          await Helper.retrievePerson()?.delete();
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
            validator: (value) => ValidationService.validateEmail(value),
            textEditingController: email,
          ),
          const Gap(25),
          CostumeTextFiled(
            isPassword: true,
            title: "New password",
            textEditingController: password,
          ),
          const Gap(25),
          Row(
            children: [
              Expanded(
                child: CostumeTextFiled(
                  validator: (value) =>
                      ValidationService.validatePhoneNumber(value),
                  keyboardType: TextInputType.phone,
                  title: "Phone1",
                  textEditingController: phone1,
                ),
              ),
              const Gap(10),
              Expanded(
                child: CostumeTextFiled(
                  keyboardType: TextInputType.phone,
                  title: "Phone2",
                  textEditingController: phone2,
                ),
              ),
            ],
          ),
          const Gap(25),
          Row(
            children: [
              Expanded(
                child: CostumeTextFiled(
                  validator: (value) =>
                      ValidationService.validateEmpty(value, "Your Location"),
                  title: "Location",
                  textEditingController: location1,
                ),
              ),
              const Gap(10),
              Expanded(
                child: CostumeTextFiled(
                  title: "Location2",
                  textEditingController: location2,
                ),
              ),
            ],
          ),
          const Gap(25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
              ),
              onPressed: () {
                EditAdvertiseData advertise = createEditAdvModel(advertiser);
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

  EditAdvertiseData createEditAdvModel(Advertiser advertiser) {
    List<String> phones = [phone1.text];
    if (phone2.text != "") {
      phones.add(phone2.text);
    }
    List<String> locations = [location1.text];

    if (location2.text != "") {
      locations.add(location2.text);
    }
    EditAdvertiseData advertise = EditAdvertiseData(
      password: password.text,
      username: username.text,
      visa: "5050",
      advertiserId: advertiser.id,
      about: about.text,
      advertiserLocations: locations,
      advertiserPhones:phones,
      advertiserType: "Shop",
      name: companyName.text,
      email: email.text,
    );
    advertise.image = UploadImageService.imageFile;
    return advertise;
  }

  setData(Advertiser advertiser) {
    companyName.text = advertiser.name ?? "";
    email.text = advertiser.email ?? "";
    username.text = advertiser.name ?? "";
    location1.text = advertiser.locations?[0] ?? "";
    location2.text =
        (advertiser.locations!.length > 1) ? advertiser.locations![1] : "";
    phone1.text = advertiser.phones?[0] ?? "";
    phone2.text = (advertiser.phones!.length > 1) ? advertiser.phones![1] : "";
    about.text = advertiser.about ?? "";
  }
}
