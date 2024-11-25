import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/change_date_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
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
    setTheDateToCubit(context);
    return BlocBuilder<ChangeDateCubit, ChangeDateState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  context.tr("startDate"),
                  style: AppStyle.style24Regular(context),
                ),
                const Gap(10),
                Expanded(
                  child: CustomDateTimeTextFiled(
                    onTap: () {
                      isFirst = false;
                      dateCubit.showFirstDate(context);

                    },
                    hintText: dateCubit.firstDate,
                    icon: const Icon(Icons.date_range),
                  ),
                ),
              ],
            ),
            const Gap(19),
            Row(
              children: [
                Text(
                  context.tr("endDate"),
                  style: AppStyle.style24Regular(context),
                ),
                const Gap(10),
                Expanded(
                  child: CustomDateTimeTextFiled(
                    onTap: () {
                      isLast = false;
                      dateCubit.showLastDate(context);

                    },
                    hintText: dateCubit.lastDate,
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
  setTheDateToCubit(BuildContext context){
    var dateCubit = ChangeDateCubit.get(context);
    if(widget.firstDate!=null&&isFirst==true&&isLast==true){
      dateCubit.firstDate=widget.firstDate??DateTime.now().toString();
      dateCubit.lastDate=widget.lastDate??DateTime.now().toString();
    }

  }
}
