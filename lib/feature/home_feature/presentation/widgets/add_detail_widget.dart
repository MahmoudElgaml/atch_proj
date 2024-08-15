import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdDetailsWidget extends StatelessWidget {
  const AdDetailsWidget(
      {super.key, this.first,  this.image, this.last,this.imageAdvertise});
  final String ?image;
  final String? imageAdvertise;
  final String? first;
  final String? last;

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: 48,
                imageUrl: imageAdvertise??"",
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
                Text(first ?? ""),
                Text(last ?? ""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
