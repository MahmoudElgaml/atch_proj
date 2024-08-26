import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
                imageUrl: e.isEmpty ? " " : e,
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
