import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/AddCampaignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_campaign_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class CustomAddCampaignButton extends StatelessWidget {
  const CustomAddCampaignButton({super.key,this.onPressed});

 final  void Function()?onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
        ),
        onPressed:  onPressed,
        child: BlocBuilder<AddCampaignCubit, AddCampaignState>(
          builder: (context, state) {
            if(state is AddCampaignLoadingState){
              return const CircularProgressIndicator();
            }
            else if (state is AddCampaignSuccessState){
              return const Text("Success");
            }
            else if(state is AddCampaignFailState){
              return Text(state.message);
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add Campaign",
                style: AppStyle.style24Regular(context).copyWith(
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
