import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:atch_proj/feature/account_feature/user/presentation/manager/edit_user_cubit.dart';
import 'package:atch_proj/feature/map_feature/presentation/manager/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      getIt<HiveManager>().retrieveSingleData<Person>(HiveKeys.userBox)?.role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.PrimaryColor,
        toolbarHeight: MediaQuery.sizeOf(context).height * .22,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: SingleChildScrollView(
          child: role == "user"
              ? BlocProvider(
                  create: (context) => getIt<EditUserCubit>(),
                  child: const UserEditScreen(),
                )
              : MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => getIt<AdvertiseInfoCubit>(),
                    ),
                    BlocProvider(
                      create: (context) => MapCubit(),
                    ),
                  ],
                  child: const AdvertiseEditScreen(),
                ),
        ),
      ),
    );
  }
}
