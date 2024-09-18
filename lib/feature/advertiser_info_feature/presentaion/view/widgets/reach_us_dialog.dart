import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../generated/assets.dart';

class ReachUsDialog extends StatelessWidget {
  const ReachUsDialog(
      {super.key,
      required this.number,
      required this.locations,
      required this.phones});

  final String? number;
  final Map<String, dynamic> locations;
  final List<String> phones;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "our locations",
            style: AppStyle.style18Regular(context),
          ),
          const Gap(7),
          Column(
            children: locations.entries
                .map(
                  (e) => Row(
                    children: [
                      Text(e.key),
                      const Gap(15),
                      InkWell(
                          onTap: () => Helper.lunchUUrl(e.value),
                          child: SvgPicture.asset(Assets.imagesLocations))
                    ],
                  ),
                )
                .toList(),
          ),
          const Gap(10),
          Text(
            "our number",
            style: AppStyle.style18Regular(context),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: phones
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () => Helper.lunchWhatsapp(e),
                        child: SvgPicture.asset(Assets.imagesWhatsIcon)),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
