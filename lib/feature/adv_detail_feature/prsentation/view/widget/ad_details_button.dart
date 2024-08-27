import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/manger/qr_offer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

class AdDetailsButton extends StatelessWidget {
  const AdDetailsButton({super.key,required this.campaignId});
 final  num? campaignId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<QrOfferCubit, QrOfferState>(
      listener: (context, state) async{
      if(state is QrOfferCheckLoadingState){
        EasyLoading.show();
      }
      else if(state is QrOfferCheckFailState ){
       await EasyLoading.showError(state.message);
        EasyLoading.dismiss();
      }
      else if(state is QrOfferCheckSuccessState){
        context.push(AppRoute.qrOffer,extra: campaignId);
        EasyLoading.dismiss();
      }
      },
      child: InkWell(
        onTap: () => QrOfferCubit.get(context).checkOfferValidate(campaignId),
        child: Container(
          height: 85,
          width: 350,
          decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Text(
                  "Get Offer",
                  style: AppStyle.style13(context)
                      .copyWith(fontSize: 30, fontWeight: FontWeight.w400),
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
