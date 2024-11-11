import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
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
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/date_section_widget.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/custom_drop_menu.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/service_locator/config.dart';
import '../manager/link_feature_cubit.dart';

class AddCampaignScreen extends StatefulWidget {
  const AddCampaignScreen({super.key});

  @override
  State<AddCampaignScreen> createState() => _AddCampaignScreenState();
}

class _AddCampaignScreenState extends State<AddCampaignScreen> {
  final TextEditingController companyName = TextEditingController();

  final TextEditingController description = TextEditingController();

  final TextEditingController price = TextEditingController();

  final TextEditingController offer = TextEditingController();

  final LinkFeatureCubit linkCubit = getIt<LinkFeatureCubit>();

  var validateState = GlobalKey<FormState>();

  @override
  void dispose() {
    companyName.dispose();
    description.dispose();
    price.dispose();
    offer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
        ),
        body: Form(
          key: validateState,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: 302 / 212,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.grayColor,
                          ),
                          width: double.infinity,
                          height: 212,
                          child: Center(
                            child: SvgPicture.asset(
                              Assets.imagesAddPhotoIcon,
                              width: 123,
                              height: 123,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FirstForm(
                          companyName: companyName,
                          description: description,
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
                          textInputType: TextInputType.number,
                          validator: (value) => AddCampaignCubit.get(context)
                              .validateOfferUponPrice(
                            offer: value ?? "",
                            price: price.text,
                          ),
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
                          title: context.tr("bAddCampaign"),
                          onPressed: () async {
                            if (validateState.currentState!.validate()) {
                              var adToken = getIt<HiveManager>()
                                  .retrieveSingleData<Person>(HiveKeys.userBox)
                                  ?.id;
                              AddCampaignModel addCampaignModel =
                                  createAddCampaignModel(adToken, context);
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

  AddCampaignModel createAddCampaignModel(num? adToken, BuildContext context) {
    var addCampaignCubit = AddCampaignCubit.get(context);
    Map<String, dynamic> theLocation = {};
    theLocation[addCampaignCubit.selectedLocation] =
        Helper.retrievePerson()?.locations?[addCampaignCubit.selectedLocation];
    AddCampaignModel addCampaignModel = AddCampaignModel(
      advertiserId: adToken,
      campaignLocation: theLocation,
      campaignPrice: int.parse(price.text),
      campaignOffer: offer.text == "" ? null : int.parse(offer.text),
      campaignDescription: description.text,
      campaignStartDate: ChangeDateCubit.get(context).firstDate,
      campaignEndDate: ChangeDateCubit.get(context).lastDate,
      campaignName: companyName.text,
      campaignTargetAudience: addCampaignCubit.selectedAudience,
      campaignVideos: linkCubit.links,
      images: AddImageCubit.get(context).backendImages,
    );
    return addCampaignModel;
  }
}

class FirstForm extends StatefulWidget {
  const FirstForm({
    super.key,
    required this.companyName,
    required this.description,
  });

  final TextEditingController companyName;

  final TextEditingController description;

  static const Map<String, String> items = {
    "kids (1-3)": "Babies",
    "biggerKids (4-12)": "Kids",
    "teenagers(13-20)": "Teenagers",
    "adults(20-40)": "Adults",
    "elder(+40)": "Elder",
  };

  @override
  State<FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  final List<String> locations =
      Helper.retrievePerson()?.locations?.keys.toList() ?? [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              context.tr("companyName"),
              style: AppStyle.style21Regular(context),
            ),
            CustomCampaignTextFiled(
              validator: (value) => ValidationService.validateEmpty(
                value,
                "Company Name",
              ),
              hint: "ex: Great Eagle",
              textEditingController: widget.companyName,
              maxLine: 1,
            ),
          ],
        ),
        const Gap(19),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("targetAudience"),
              style: AppStyle.style21Regular(context),
            ),
            const Gap(3),
            CustomDropMenu(
              setValue: (value) {
                AddCampaignCubit.get(context).selectedAudience = value;
              },
              items: FirstForm.items,
              selectedValue: AddCampaignCubit.get(context).selectedAudience,
              isAuth: false,
            ),
          ],
        ),
        const Gap(18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr("location"),
              style: AppStyle.style24Regular(context),
            ),
            const Gap(3),
            CustomDropMenu(
              setValue: (value) {
                AddCampaignCubit.get(context).selectedLocation = value;
              },
              items: Map.fromIterable(locations),
              selectedValue: AddCampaignCubit.get(context).selectedLocation,
              isAuth: false,
            ),
          ],
        ),
        const Gap(19),
        Column(
          children: [
            Text(
              context.tr("description"),
              style: AppStyle.style21Regular(context),
            ),
            CustomCampaignTextFiled(
              validator: (value) =>
                  ValidationService.validateEmpty(value, "Description"),
              textEditingController: widget.description,
              hint: "ex: we offer",
              maxLine: 6,
            ),
          ],
        ),
      ],
    );
  }
}
