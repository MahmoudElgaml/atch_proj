import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/add_link_section.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/add_photo_section.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/custom_camapaign_textfiled.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/custom_date_time_text_filed.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/widgets/date_section_widget.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/custom_drop_menu.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddCampaignScreen extends StatelessWidget {
  const AddCampaignScreen({super.key});

  static const List<String> items = [
    "kids (1-3)",
    "biggerKids (4-12)",
    "teenagers(13-20)",
    "adults(20-40)",
    "elder(+40)"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
            surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
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
                      const CustomCampaignTextFiled(
                        icon: Icon(Icons.person_2_outlined),
                        hint: "Campaign Name",
                        maxLine: 1,
                        labelText: "Campaign Name",
                      ),
                      const Gap(19),
                      const CustomCampaignTextFiled(
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
                              items: items,
                              selectedValue: items[0],
                              isAuth: false,
                            ),
                          ),
                        ],
                      ),
                      const Gap(19),
                      const DateSectionWidget(),
                      const Gap(19),
                      const CustomCampaignTextFiled(
                        hint: "Price",
                        maxLine: 1,
                        labelText: "Price",
                        icon: Icon(Icons.attach_money_sharp),
                      ),
                      const Gap(19),
                      const CustomCampaignTextFiled(
                        hint: "Offer",
                        maxLine: 1,
                        labelText: "Offer",
                        icon: Icon(Icons.attach_money_sharp),
                      ),
                      const Gap(19),
                      const AddPhotoSection(),
                      const Gap(20),
                      const AddLinkSection(),
                      const Gap(20),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor
                            ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Add Campaign",
                              style: AppStyle.style24Regular(context)
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
