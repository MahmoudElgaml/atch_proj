import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/change_date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/helper.dart';
import 'custom_date_time_text_filed.dart';

class DateSectionWidget extends StatefulWidget {
  const DateSectionWidget({super.key, this.lastDate, this.firstDate});

  final String? firstDate;
  final String? lastDate;

  @override
  State<DateSectionWidget> createState() => _DateSectionWidgetState();
}

class _DateSectionWidgetState extends State<DateSectionWidget> {
  bool isFirst = true;

  bool isLast = true;

  @override
  Widget build(BuildContext context) {
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
                      isFirst = false;
                      dateCubit.showFirstDate(context);

                    },
                    hintText: isFirst
                        ? widget.firstDate ?? dateCubit.firstDate
                        : dateCubit.firstDate,
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
                      isLast = false;
                      dateCubit.showLastDate(context);

                    },
                    hintText: isLast
                        ? widget.lastDate ?? dateCubit.lastDate
                        : dateCubit.lastDate,
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
