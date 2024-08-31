import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/manger/qr_offer_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../generated/assets.dart';

class AdDetailsButton extends StatelessWidget {
  const AdDetailsButton({super.key, required this.campaignId});

  final num? campaignId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrOfferCubit, QrOfferState>(
      listener: (context, state) async {
        if (state is QrOfferCheckLoadingState) {
          EasyLoading.show();
        } else if (state is QrOfferCheckFailState) {
          EasyLoading.dismiss();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                state.message,
                style: AppStyle.style24Regular(context),
              ),
              backgroundColor: Colors.white,
              icon: Image.asset(
                Assets.imagesClose,
                width: 100,
                height: 100,
              ),
              titlePadding: const EdgeInsets.all(8),
            ),
          );
        } else if (state is QrOfferCheckSuccessState) {
          context.push(AppRoute.qrOffer, extra: campaignId);
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
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                children: [
                  Text(
                    context.tr("takeOffer"),
                    style: AppStyle.style13(context)
                        .copyWith(fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const Gap(20),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
