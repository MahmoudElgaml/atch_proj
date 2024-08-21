import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/change_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/helper.dart';
import 'custom_date_time_text_filed.dart';

class DateSectionWidget extends StatelessWidget {
  const DateSectionWidget({super.key, this.lastDate, this.firstDate});

  final String? firstDate;
  final String? lastDate;

  @override
  Widget build(BuildContext context) {
    bool isFirst = false;
    bool isLast = false;
    var dateCubit = ChangeDateCubit.get(context);
    return BlocBuilder<ChangeDateCubit, ChangeDateState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  "Start Date :",
                  style: AppStyle.style24Regular(context),
                ),
                const Gap(10),
                Expanded(
                  child: CustomDateTimeTextFiled(
                    onTap: () {
                      dateCubit.showFirstDate(context);
                      isFirst = true;
                    },
                    hintText: isFirst
                        ? firstDate ?? Helper.dateToString(dateCubit.firstDate)
                        : Helper.dateToString(dateCubit.firstDate),
                    icon: const Icon(Icons.date_range),
                  ),
                ),
              ],
            ),
            const Gap(19),
            Row(
              children: [
                Text(
                  "End Date :",
                  style: AppStyle.style24Regular(context),
                ),
                const Gap(10),
                Expanded(
                  child: CustomDateTimeTextFiled(
                    onTap: () {
                      dateCubit.showLastDate(context);
                      isLast = true;
                    },
                    hintText: isLast
                        ? lastDate ?? Helper.dateToString(dateCubit.lastDate)
                        : Helper.dateToString(dateCubit.lastDate),
                    icon: const Icon(Icons.date_range),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
