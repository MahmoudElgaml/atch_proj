import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/routes/routes.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../page/widgets/account_first_section.dart';
import '../../../data/model/AdvertiseInfo.dart';
import '../../manager/advertise_info_cubit.dart';

class EditButtonBuilderForAdv extends StatelessWidget {
  const EditButtonBuilderForAdv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertiseInfoCubit, AdvertiseInfoState>(
      builder: (context, state) {
        return InkWell(
          onTap: AdvertiseInfoCubit.get(context).isDone
              ? () {
            Advertiser? advertiser = AdvertiseInfoCubit.get(context)
                .advertiseInfoModel
                ?.advertiser
                ?.copyWith();
            context.push(
              AppRoute.editUserPage,
              extra: advertiser,
            );
          }
              : null,
          child:  const EditButton(
            color: AppColor.primaryColor,
            title: "editProfile",
            icon: Icons.edit,

          ),
        );
      },
    );
  }
}