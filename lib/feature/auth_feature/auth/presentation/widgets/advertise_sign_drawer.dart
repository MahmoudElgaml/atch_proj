import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/custom_camapaign_textfiled.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/custom_drop_menu.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/services/upload_image_service.dart';
import '../../../../../core/services/validation_service.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
import '../../data/model/SignDataTest.dart';
import '../manger/auth_cubit.dart';
import '../pages/test_upload_image.dart';
import 'coatume_auth_button.dart';
import 'costume_text_filed.dart';
import 'logo_widget.dart';

class AdvertiseSignDrawer extends StatefulWidget {
  const AdvertiseSignDrawer({super.key});

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
  State<AdvertiseSignDrawer> createState() => _AdvertiseSignDrawerState();
}

class _AdvertiseSignDrawerState extends State<AdvertiseSignDrawer> {
  TextEditingController companyName = TextEditingController();

  TextEditingController advertiseName = TextEditingController();

  TextEditingController about = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController location = TextEditingController();
  TextEditingController referralCode = TextEditingController();


  String selectedValue = "Factory";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          Center(
            child: Text(
              "Sign Up",
              style: AppStyle.style34(context),
            ),
          ),
          const Gap(32),
          CostumeTextFiled(
            validator: (value) =>
                ValidationService.validateEmpty(value, "Company"),
            title: "Company Name",
            textEditingController: companyName,
          ),
          const Gap(20),
          CostumeTextFiled(
            validator: (value) =>
                ValidationService.validateEmpty(value, "Advertise Name"),
            title: "Advertise Name",
            textEditingController: advertiseName,
          ),
          const Gap(20),
          CostumeTextFiled(
            validator: (value) => ValidationService.validateEmail(value),
            title: "Email",
            textEditingController: email,
          ),
          const Gap(20),
          CostumeTextFiled(
            title: "about",
            textEditingController: about,
          ),
          const Gap(20),
          CostumeTextFiled(
            isPassword: true,
            validator: (value) =>
                ValidationService.validateEmpty(value, "Password"),
            title: "Password",
            textEditingController: password,
          ),
          const Gap(20),
          CostumeTextFiled(
            validator: (value) => ValidationService.validatePhoneNumber(value),
            keyboardType: TextInputType.phone,
            title: "phone",
            textEditingController: phone,
          ),
          const Gap(20),
          CostumeTextFiled(
            validator: (value) =>
                ValidationService.validateEmpty(value, "Your Location"),
            title: "location",
            textEditingController: location,
          ),
          const Gap(20),
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
          const Gap(25),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              style: AppStyle.styleRegularOpacity,
              AppString.helpMessage,
            ),
          ),
          CustomDropMenu(
            items: AdvertiseSignDrawer.items,
            selectedValue: selectedValue,
            isAuth: true,
            setValue: (value) => selectedValue = value,
          ),
          const Gap(20),
          CostumeButton(
            title: "SignUP",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                SignDataTest signData = setSignData();
                AuthCubit.get(context).signIn(signData);
              }
            },
            isLoading: false,
          ),
          const Gap(32),
          Center(
            child: Text(
              style: AppStyle.styleRegularOpacity,
              "or Sign Un With",
            ),
          ),
          const Gap(28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(style: AppStyle.styleRegularOpacity, "Existing User? "),
              InkWell(
                onTap: () {
                  context.go(AppRoute.logInKey);
                },
                child: const Text(
                  "Log in",
                  style: TextStyle(color: AppColor.authColor),
                ),
              ),
            ],
          ),
          const Gap(10),
        ],
      ),
    );
  }

  SignDataTest setSignData() {
    List<String> phones = [phone.text];
    List<String> locations = [location.text];
    SignDataTest signData = SignDataTest();
    signData.name = companyName.text;
    signData.username = advertiseName.text;
    signData.email = email.text;
    signData.about = about.text;
    signData.password = password.text;
    signData.advertiserPhones = phones;
    signData.advertiserLocation = locations;
    signData.role = "advertiser";
    signData.advertiserType = selectedValue;
    signData.image = UploadImageService.imageFile;
    return signData;
  }
}
