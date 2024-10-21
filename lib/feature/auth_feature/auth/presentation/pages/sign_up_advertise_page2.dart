import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/coatume_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/upload_image_service.dart';
import '../../../../../core/services/validation_service.dart';
import '../../../../add_edit_campagin_feature/presentaion/view/widgets/custom_camapaign_textfiled.dart';
import '../../data/model/SignDataTest.dart';
import '../manger/auth_cubit.dart';
import '../NewWidgets/costume_text_filed.dart';
import '../NewWidgets/loction_section_widget.dart';

class SignUpAdvertisePage2 extends StatefulWidget {
  const SignUpAdvertisePage2({super.key});

  @override
  State<SignUpAdvertisePage2> createState() => _SignUpAdvertisePage2State();
}

class _SignUpAdvertisePage2State extends State<SignUpAdvertisePage2> {
  TextEditingController phone1 = TextEditingController();

  TextEditingController phone2 = TextEditingController();

  TextEditingController location1 = TextEditingController();

  TextEditingController location1Link = TextEditingController();

  TextEditingController location2 = TextEditingController();

  TextEditingController location2Link = TextEditingController();

  TextEditingController referralCode = TextEditingController();
  TextEditingController about = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CostumeTextFiled(
                validator: (value) =>
                    ValidationService.validatePhoneNumber(value),
                keyboardType: TextInputType.phone,
                title: "Phone1",
                textEditingController: phone1,
              ),
              const Gap(15),
              CostumeTextFiled(
                keyboardType: TextInputType.phone,
                title: "Phone2",
                textEditingController: phone2,
              ),
              const Gap(15),
              LocationSectionWidget(
                location1: location1,
                location1Link: location1Link,
                location2: location2,
                location2Link: location2Link,
              ),
              const Gap(15),
              CostumeTextFiled(
                title: "about",
                textEditingController: about,
                maxLine: 6,
              ),
              const Gap(15),
              SizedBox(
                width: 200,
                child: CustomCampaignTextFiled(
                  hint: "",
                  maxLine: 1,
                  textEditingController: referralCode,
                  labelText: "ReferralCode",
                  textInputType: TextInputType.phone,
                ),
              ),
              const Gap(20),
              CostumeAuthButton(
                title: "Sign UP",
                onPressed: () {
                  AuthCubit.get(context).signIn(setSignData());
                },
                isLoading: false,
              )
            ],
          ),
        ),
      ),
    );
  }

  SignDataTest setSignData() {
    var authCubit = AuthCubit.get(context);
    List<String> phones = [phone1.text];
    if (phone2.text != "") {
      phones.add(phone2.text);
    }
    Map<String, String>? locations = {};
    locations[location1.text] = location1Link.text;

    if (location2.text != "") {
      locations[location2.text] = location2Link.text;
    }

    SignDataTest signData = SignDataTest();
    signData.name = authCubit.companyName.text;
    signData.username = authCubit.advertiseName.text;
    signData.email = authCubit.email.text.trim();
    signData.about = about.text;
    signData.password = authCubit.password.text;
    signData.advertiserPhones = phones;
    signData.advertiserLocation = locations;
    signData.role = "advertiser";
    signData.advertiserType = authCubit.selectedValue;
    signData.image = UploadImageService.imageFile;
    return signData;
  }
}
