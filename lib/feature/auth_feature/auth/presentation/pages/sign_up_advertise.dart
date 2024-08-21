import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/core/services/validation_service.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/SignDataTest.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/advertise_sign_drawer.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/logo_widget.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/social_button.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
import '../../data/model/SignData.dart';
import '../manger/auth_cubit.dart';
import '../widgets/coatume_auth_button.dart';
import '../widgets/costume_text_filed.dart';
import '../widgets/custom_drop_menu.dart';

class SignUpAdvertise extends StatefulWidget {
  const SignUpAdvertise({super.key});

  @override
  State<SignUpAdvertise> createState() => _SignUpAdvertiseState();
}

class _SignUpAdvertiseState extends State<SignUpAdvertise> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 36, right: 36),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: LogoWidget()),
                  Expanded(child: TestUploadImage(isEdit: false)),
                ],
              ),
              AdvertiseSignDrawer()
            ],
          ),
        ),
      ),
    );
  }
}
