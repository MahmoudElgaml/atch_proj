import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_campaign_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class CustomAddCampaignButton extends StatelessWidget {
  const CustomAddCampaignButton({super.key, this.onPressed,required this.title});

  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
          ),
          onPressed: onPressed,
          child: BlocConsumer<AddCampaignCubit, AddCampaignState>(
            listener: (context, state) {
              if(state is AddCampaignLoadingState){
                EasyLoading.show();
              }
              if(state is AddCampaignSuccessState){
                EasyLoading.dismiss();
                context.pop();
              }
              if(state is AddCampaignFailState){
                EasyLoading.showError("Some thing went Error");
              }
            },
            builder: (context, state) {
               if (state is AddCampaignFailState) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.message,
                    style: AppStyle.style24Regular(context)
                        .copyWith(color: Colors.white),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: AppStyle.style24Regular(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
