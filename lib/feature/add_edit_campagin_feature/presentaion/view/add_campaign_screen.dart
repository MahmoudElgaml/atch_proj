import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/services/validation_service.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/AddCampaignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_campaign_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_image_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/change_date_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/add_link_section.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/add_photo_section.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/custom_add_campaign_button.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/custom_camapaign_textfiled.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/custom_date_time_text_filed.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/date_section_widget.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/custom_drop_menu.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/service_locator/config.dart';
import '../manager/link_feature_cubit.dart';

class AddCampaignScreen extends StatelessWidget {
  AddCampaignScreen({super.key});

  static const Map<String, String> items = {
    "kids (1-3)": "Babies",
    "biggerKids (4-12)": "Kids",
    "teenagers(13-20)": "Teenagers",
    "adults(20-40)": "Adults",
    "elder(+40)": "Elder",
  };
  String selectedValue = "Babies";
  final TextEditingController companyName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController offer = TextEditingController();
  final LinkFeatureCubit linkCubit = getIt<LinkFeatureCubit>();
  var validateState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: validateState,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 40,
                        child: Image.asset(Assets.imagesGLogo),
                      ),
                    ),
                    const Gap(20),
                    Text(
                      "Create Advertise",
                      style: AppStyle.style24Regular(context),
                    ),
                    const Gap(19),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCampaignTextFiled(
                          validator: (value) => ValidationService.validateEmpty(
                              value, "Company Name"),
                          textEditingController: companyName,
                          icon: const Icon(Icons.person_2_outlined),
                          hint: "Campaign Name",
                          maxLine: 1,
                          labelText: "Campaign Name",
                        ),
                        const Gap(19),
                        CustomCampaignTextFiled(
                          validator: (value) => ValidationService.validateEmpty(
                              value, "Description"),
                          textEditingController: description,
                          hint: "Description",
                          maxLine: 3,
                          labelText: "Description",
                        ),
                        const Gap(19),
                        Row(
                          children: [
                            Text(
                              "Target audience",
                              style: AppStyle.style24Regular(context),
                            ),
                            const Gap(19),
                            Expanded(
                              child: CustomDropMenu(
                                setValue: (value) {
                                  selectedValue = value;
                                },
                                items: items,
                                selectedValue: selectedValue,
                                isAuth: false,
                              ),
                            ),
                          ],
                        ),
                        const Gap(19),
                        const DateSectionWidget(),
                        const Gap(19),
                        CustomCampaignTextFiled(
                          validator: (value) =>
                              ValidationService.validateEmpty(value, "Price"),
                          textInputType: TextInputType.number,
                          textEditingController: price,
                          hint: "Price",
                          maxLine: 1,
                          labelText: "Price",
                          icon: const Icon(Icons.attach_money_sharp),
                        ),
                        const Gap(19),
                        CustomCampaignTextFiled(
                          validator: (value) =>
                              ValidationService.validateEmpty(value, "offer"),
                          textInputType: TextInputType.number,
                          textEditingController: offer,
                          hint: "Offer",
                          maxLine: 1,
                          labelText: "Offer",
                          icon: const Icon(Icons.attach_money_sharp),
                        ),
                        const Gap(19),
                        const AddPhotoSection(),
                        const Gap(20),
                        AddLinkSection(
                          linkCubit: linkCubit,
                        ),
                        const Gap(20),
                        CustomAddCampaignButton(
                          onPressed: () async {
                            print(selectedValue);
                            if (validateState.currentState!.validate()) {
                              var adToken = await StorageToken().getToken();
                              var adId = int.parse(adToken!);

                              AddCampaignModel addCampaignModel =
                                  AddCampaignModel(
                                advertiserId: adId,
                                campaignPrice: int.parse(price.text),
                                campaignOffer: int.parse(offer.text),
                                campaignDescription: description.text,
                                campaignStartDate: Helper.dateToString(
                                        ChangeDateCubit.get(context).firstDate)
                                    .substring(0, 10),
                                campaignEndDate: Helper.dateToString(
                                        ChangeDateCubit.get(context).lastDate)
                                    .substring(0, 10),
                                campaignLocation: ["cairo"],
                                campaignName: companyName.text,
                                campaignTargetAudience: selectedValue,
                                campaignVideos: linkCubit.links,
                                images:
                                    AddImageCubit.get(context).backendImages,
                              );
                              AddCampaignCubit.get(context)
                                  .addCampaign(addCampaignModel);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
