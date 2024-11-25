import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/services/snack_bar_services.dart';
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
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/first_form.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/price_offer_section.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/custom_drop_menu.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    const CoverImageSection(),
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
                        PriceOfferSection(
                          price: price,
                          offer: offer,
                        ),
                        const Gap(19),
                        AddLinkSection(
                          linkCubit: linkCubit,
                        ),
                        const Gap(20),
                        const AddPhotoSection(
                          isEdit: false,
                        ),
                        const Gap(20),
                        CustomAddCampaignButton(
                          title: context.tr("bAddCampaign"),
                          onPressed: () async {
                            if (validateState.currentState!.validate()) {
                              if (AddImageCubit.get(context).images.isEmpty) {
                                print("No Image");
                                SnackBarServices.showCoverImageValidate();
                              } else {
                                var adToken = getIt<HiveManager>()
                                    .retrieveSingleData<Person>(
                                        HiveKeys.userBox)
                                    ?.id;
                                AddCampaignModel addCampaignModel =
                                    createAddCampaignModel(adToken, context);
                                AddCampaignCubit.get(context)
                                    .addCampaign(addCampaignModel);
                              }
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
    UserLocations? theLocation = UserLocations();

    Helper.setTheLocationUponUserSelection(addCampaignCubit, theLocation);

    AddCampaignModel addCampaignModel = AddCampaignModel(
      advertiserId: adToken,
      locations: theLocation,
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

class CoverImageSection extends StatelessWidget {
  const CoverImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AddImageCubit.get(context).addCoverImage();
      },
      child: Center(
        child: AspectRatio(
          aspectRatio: 302 / 212,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.grayColor,
            ),
            width: double.infinity,
            height: 212,
            child: BlocBuilder<AddImageCubit, AddImageState>(
              buildWhen: (previous, current) {
                return current is AddImageCoverSuccessState ||
                    current is AddImageCoverDeletedState;
              },
              builder: (context, state) {
                var image = AddImageCubit.get(context).images.isEmpty
                    ? null
                    : AddImageCubit.get(context).images.first;
                return image == null
                    ? Center(
                        child: SvgPicture.asset(
                          Assets.imagesAddPhotoIcon,
                          width: 123,
                          height: 123,
                        ),
                      )
                    : Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.memory(
                                image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              AddImageCubit.get(context).deleteCoverImage();
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.red,
                            ),
                          )
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
