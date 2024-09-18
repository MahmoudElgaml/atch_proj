import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/api/end_points.dart';

class AdDetailsWidget extends StatelessWidget {
  const AdDetailsWidget({super.key,
    this.first,
    this.image,
    this.last,
    this.imageAdvertise,
    required this.isProfile});

  final String? image;
  final String? imageAdvertise;
  final String? first;
  final String? last;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isProfile ? 7 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: 48,
                imageUrl: "${EndPoints.baseUrl}$imageAdvertise" ?? "",
                width: 48,
                errorWidget: (context, url, error) => Image.asset(
                  Assets.imagesDate,
                ),
              ),
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isProfile ? first ?? "" : first ?? "",
                  style: AppStyle.style18(context),
                ),
                Text(
                  isProfile ? last ?? "" : last ?? "",
                  style: AppStyle.style18(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
