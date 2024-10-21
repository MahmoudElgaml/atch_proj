import 'package:atch_proj/config/routes/navigation_helper.dart';
import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/components/general_button.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/select_business_section.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/NewWidgets/sign_up_advertise_form_1.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/services/validation_service.dart';
import '../NewWidgets/costume_text_filed.dart';
import '../NewWidgets/custom_drop_menu.dart';

class SignUpAdvertisePage extends StatelessWidget {
  const SignUpAdvertisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TestUploadImage(isEdit: false),
              const Gap(37),
              const SignUpAdvertiseForm1(),
              const Gap(24),
              const SelectBusinessSection(),
              const Gap(50),
              GeneralButton(
                onPressed: () {
                  context.push(AppRoute.signUpAsAdvertise2);
                },
                title: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
