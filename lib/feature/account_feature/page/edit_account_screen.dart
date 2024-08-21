import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/costume_text_filed.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../core/utils/service_locator/config.dart';
import '../../auth_feature/auth/data/model/UserData.dart';
import '../advertise/presentation/view/edit_advertise_screen.dart';
import '../user/presentation/view/edit_user_screen.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  var role =
      getIt<HiveManager>().retrieveData<Person>(HiveKeys.userBox)[0].role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        backgroundColor: AppColor.primaryColor,
        toolbarHeight: MediaQuery.sizeOf(context).height * .22,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: SingleChildScrollView(
          child: role == "user"
              ? const UserEditScreen()
              : const AdvertiseEditScreen(),
        ),
      ),
    );
  }
}
