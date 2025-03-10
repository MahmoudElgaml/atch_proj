import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/EditCampignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/old_image_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/add_link_section.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/add_photo_section.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/custom_add_campaign_button.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/custom_camapaign_textfiled.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/date_section_widget.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/old_image_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/services/validation_service.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/service_locator/config.dart';
import '../../../../generated/assets.dart';
import '../../../auth_feature/auth/presentation/widgets/custom_drop_menu.dart';
import '../manager/add_campaign_cubit.dart';
import '../manager/add_image_cubit.dart';
import '../manager/change_date_cubit.dart';
import '../manager/link_feature_cubit.dart';

class EditCampaignScreen extends StatefulWidget {
  const EditCampaignScreen({super.key});

  static const Map<String, String> items = {
    "kids (1-3)": "Babies",
    "biggerKids (4-12)": "Kids",
    "teenagers(13-20)": "Teenagers",
    "adults(20-40)": "Adults",
    "elder(+40)": "Elder",
  };

  @override
  State<EditCampaignScreen> createState() => _EditCampaignScreenState();
}

class _EditCampaignScreenState extends State<EditCampaignScreen> {
  String selectedValue = "Babies";

  final TextEditingController companyName = TextEditingController();

  final TextEditingController description = TextEditingController();

  final TextEditingController price = TextEditingController();

  final TextEditingController offer = TextEditingController();
  final List<String> locations =
      Helper.retrievePerson()?.locations?.keys.toList() ?? [];

  String selectedLocation = "";

  final LinkFeatureCubit linkCubit = getIt<LinkFeatureCubit>();
  bool setValues = true;
  var validateState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AdvertiseCampaigns campaign =
        GoRouterState.of(context).extra as AdvertiseCampaigns;
    if (setValues) {
      linkCubit.setOldLink(campaign.videos ?? []);
      setController(campaign);
      setValues = false;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
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
                      context.tr("createAdvertise"),
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
                              context.tr("targetAudience"),
                              style: AppStyle.style24Regular(context),
                            ),
                            const Gap(19),
                            Expanded(
                              child: CustomDropMenu(
                                setValue: (value) {
                                  selectedValue = value;
                                },
                                items: EditCampaignScreen.items,
                                selectedValue: selectedValue,
                                isAuth: false,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              context.tr("location"),
                              style: AppStyle.style24Regular(context),
                            ),
                            const Gap(19),
                            Expanded(
                              child: CustomDropMenu(
                                setValue: (value) {
                                  selectedLocation = value;
                                },
                                items: Map.fromIterable(locations),
                                selectedValue: selectedLocation,
                                isAuth: false,
                              ),
                            ),
                          ],
                        ),
                        const Gap(19),
                        DateSectionWidget(
                          firstDate: campaign.startDate,
                          lastDate: campaign.endDate,
                        ),
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
                        OldImageSection(oldImages: campaign.images ?? []),
                        const Gap(19),
                        const AddPhotoSection(),
                        const Gap(20),
                        AddLinkSection(
                          linkCubit: linkCubit,
                        ),
                        CustomAddCampaignButton(
                          title: "Update",
                          onPressed: () {
                            EditCampignModel editModel =
                                createEditCampaignModel(campaign, context);
                            AddCampaignCubit.get(context)
                                .editCampaign(editModel);
                          },
                        ),
                        const Gap(20),
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

  EditCampignModel createEditCampaignModel(
      AdvertiseCampaigns campaign, BuildContext context) {
    print(ChangeDateCubit.get(context).firstDate);
    print(ChangeDateCubit.get(context).lastDate);
    Map<String, dynamic> selectedLocationAsMap = {};
    selectedLocationAsMap[selectedLocation] =
        Helper.retrievePerson()?.locations?[selectedLocation];
    EditCampignModel editModel = EditCampignModel(
      campaignId: campaign.id,
      oldCampaignImages: OldImageCubit.get(context).myImages,
      campaignPrice: int.parse(price.text),
      campaignOffer: offer.text == "" ? null : int.parse(offer.text),
      campaignDescription: description.text,
      campaignLocation: selectedLocationAsMap,
      campaignStartDate: ChangeDateCubit.get(context).firstDate,
      campaignEndDate: ChangeDateCubit.get(context).lastDate,
      campaignName: companyName.text,
      campaignVideos: linkCubit.links,
      images: AddImageCubit.get(context).backendImages,
    );
    return editModel;
  }

  setController(AdvertiseCampaigns campaign) {
    companyName.text = campaign.campaignName ?? "";
    description.text = campaign.description ?? "";
    price.text = campaign.price.toString();
    offer.text = campaign.offer == null ? "" : campaign.offer.toString();
    selectedValue = campaign.targetAudience ?? "";
    selectedLocation =
        Helper.retrievePerson()?.locations?.entries.first.key ?? "";
  }
}
