import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdDetailsLocationWidget extends StatelessWidget {
  const AdDetailsLocationWidget(this.image, this.location, {super.key});

  final String image;
  final List<MapEntry<String, dynamic>> location;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Helper.lunchUUrl(location.first.value);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: location
                    .map(
                      (e) => Text(e.key, style: AppStyle.style18(context)),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
