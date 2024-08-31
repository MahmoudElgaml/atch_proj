import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdDetailsFistSection extends StatelessWidget {
  const AdDetailsFistSection({super.key, required this.campaign});

  final DetailCampaigns? campaign;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: campaign?.images
          ?.map(
            (e) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: e.isEmpty ? " " : "http://92.113.26.243:5000$e",
                errorWidget: (context, url, error) => SvgPicture.asset(
                  Assets.imagesEmptyImage,
                  fit: BoxFit.fill,
                ),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
          animateToClosest: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false),
    );
  }
}
