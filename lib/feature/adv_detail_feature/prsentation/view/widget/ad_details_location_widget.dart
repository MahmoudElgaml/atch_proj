import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdDetailsLocationWidget extends StatelessWidget {
  const AdDetailsLocationWidget(this.image, this.location, {super.key});

  final String image;
  final Locations? location;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Helper.lunchUUrl(location?.location0?.link ?? "");
      },
      child: Card(
        elevation: 7,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                image,
                width: 48,
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(location?.location0?.name ?? "No Location",
                    style: AppStyle.style18(context))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
