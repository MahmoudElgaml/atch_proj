import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/validation_service.dart';
import '../../../../../core/utils/app_style.dart';
import '../../manager/add_campaign_cubit.dart';
import 'custom_camapaign_textfiled.dart';

class PriceOfferSection extends StatelessWidget {
  const PriceOfferSection(
      {super.key, required this.price, required this.offer});

  final TextEditingController price;
  final TextEditingController offer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "price",
                style: AppStyle.style21Regular(context),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomCampaignTextFiled(
                      validator: (value) =>
                          ValidationService.validateEmpty(value, "Price"),
                      textInputType: TextInputType.number,
                      textEditingController: price,
                      maxLine: 1,
                    ),
                  ),
                  const Gap(9),
                  Text(
                    "LE",
                    style: AppStyle.style21Regular(context),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(19),
        Expanded(
          child: Column(
            children: [
              Text(
                "offer",
                style: AppStyle.style21Regular(context),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomCampaignTextFiled(
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          AddCampaignCubit.get(context).validateOfferUponPrice(
                        offer: value ?? "",
                        price: price.text,
                      ),
                      textEditingController: offer,
                      maxLine: 1,
                    ),
                  ),
                  const Gap(9),
                  Text(
                    "LE",
                    style: AppStyle.style21Regular(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
