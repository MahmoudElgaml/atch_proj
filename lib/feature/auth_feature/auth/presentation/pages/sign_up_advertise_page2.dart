import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/coatume_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/services/upload_image_service.dart';
import '../../../../../core/services/validation_service.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../add_edit_campagin_feature/presentaion/view/widgets/custom_camapaign_textfiled.dart';
import '../../data/model/SignDataTest.dart';
import '../../data/model/request/SignDataNew.dart';
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
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    AuthCubit.get(context).disposeAll();
    phone1.dispose();
    phone2.dispose();
    location1.dispose();
    location1Link.dispose();
    location2.dispose();
    location2Link.dispose();
    referralCode.dispose();
    print("dispose done============================== ");
    about.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.yellowColor,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Form(
              key: formKey,
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
                      if (AuthCubit.get(context)
                          .formKey
                          .currentState!
                          .validate()) {
                        AuthCubit.get(context).signIn(setSignData());
                      }
                    },
                    isLoading: false,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SignDataNew setSignData() {
    var authCubit = AuthCubit.get(context);
    List<String> phones = [phone1.text];
    if (phone2.text != "") {
      phones.add(phone2.text);
    }
    // Map<String, String>? locations = {};
    // locations[location1.text] = location1Link.text;
    //
    // if (location2.text != "") {
    //   locations[location2.text] = location2Link.text;
    // }
    Locations locations = getLocationData();
    SignDataNew signData = SignDataNew();
    signData.name = authCubit.companyName.text;
    signData.username = authCubit.advertiseName.text;
    signData.email = authCubit.email.text.trim();
    signData.about = about.text;
    signData.password = authCubit.password.text;
    signData.advertiserPhones = phones;
    signData.locations = locations;
    //  signData.advertiserLocation = locations;
    signData.role = "advertiser";
    signData.advertiserType = authCubit.selectedValue;
    signData.image = UploadImageService.imageFile;
    return signData;
  }

  Locations getLocationData() {
    var authCubit = AuthCubit.get(context);
    Location2? location2Data;
    Location1 location1Data = Location1(
      name: location1.text,
      link: location1Link.text,
        lat: authCubit.firstLocation?.latitude,
        lng: authCubit.firstLocation?.longitude);
    if (location2.text.isEmpty || location2.text == "") {
    } else {
      location2Data = Location2(
          name: location2.text,
          link: location2Link.text,
          lat: authCubit.secondLocation?.latitude,
          lng: authCubit.secondLocation?.longitude);
    }

    Locations locations = Locations(
      location1: location1Data,
      location2: location2Data,
    );
    return locations;
  }
}
