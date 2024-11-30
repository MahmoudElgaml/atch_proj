import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
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
import '../../../../../core/utils/service_locator/config.dart';
import '../../../../auth_feature/auth/presentation/pages/test_upload_image.dart';
import '../../../../auth_feature/auth/presentation/NewWidgets/costume_text_filed.dart';
import '../../../../auth_feature/auth/presentation/NewWidgets/loction_section_widget.dart';
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
  TextEditingController location1Link = TextEditingController();
  TextEditingController location2 = TextEditingController();
  TextEditingController location2Link = TextEditingController();

  TextEditingController about = TextEditingController();
  int counter = 0;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    final Advertiser advertiser =
        GoRouterState.of(context).extra! as Advertiser;
    if (counter == 0) {
      setData(advertiser);
      counter++;
    }

    return BlocListener<AdvertiseInfoCubit, AdvertiseInfoState>(
      listener: (context, state) async {
        if (state is AdvertiseAccountLoadingState) {
          EasyLoading.show();
        } else if (state is AdvertiseAccountFailState) {
          EasyLoading.dismiss();
          EasyLoading.showError("");
        } else if (state is AdvertiseAccountSuccessState) {
          await Helper.retrievePerson()?.delete();
          getIt<StorageToken>().deleteToken();
          await EasyLoading.showSuccess("");
          if (context.mounted) {
            context.go(AppRoute.logInKey);
          }
        }
      },
      child: Column(
        children: [
          const Gap(10),
          TestUploadImage(
            isClicked: (bool value) {
              isClicked = value;
            },
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
          LocationSectionWidget(
            location1: location1,
            location1Link: location1Link,
            location2: location2,
            location2Link: location2Link,
          ),
          const Gap(25),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.PrimaryColor,
              ),
              onPressed: () {
                EditAdvertiseData advertise =
                    createEditAdvModel(advertiser, isClicked);
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
          ),
          const Gap(20),
        ],
      ),
    );
  }

  EditAdvertiseData createEditAdvModel(Advertiser advertiser, bool isClicked) {
    List<String> phones = [phone1.text];
    if (phone2.text != "") {
      phones.add(phone2.text);
    }
    Map<String, dynamic>? locations = {};
    locations[location1.text] = location1Link.text;

    if (location2.text != "") {
      locations[location2.text] = location2Link.text;
    }

    EditAdvertiseData advertise = EditAdvertiseData(
      password: password.text,
      username: username.text,
      visa: "5050",
      advertiserId: advertiser.id,
      about: about.text,
      advertiserLocation: locations,
      oldImage: isClicked ? null : Helper.retrievePerson()?.profilePic,
      advertiserPhones: phones,
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
    location1.text = advertiser.locations?.location0?.name ?? "";
    location1Link.text = advertiser.locations?.location0?.link ?? "";

    location2.text = advertiser.locations?.location1?.name ?? "";
    location2Link.text = advertiser.locations?.location1?.link ?? "";

    phone1.text = advertiser.phones?[0] ?? "";
    phone2.text = (advertiser.phones!.length > 1) ? advertiser.phones![1] : "";
    about.text = advertiser.about ?? "";
  }
}
