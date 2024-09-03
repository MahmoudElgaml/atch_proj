import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/components/save_button.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ads_item_details.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdsItem extends StatelessWidget {
  const AdsItem({super.key, required this.campaigns});

  final Campaigns campaigns;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.adDetails, extra: campaigns.id);
      },
      child: AspectRatio(
        aspectRatio: 220 / 275,
        child: Card(
          borderOnForeground: true,
          shadowColor: Colors.black26,
          color: Colors.white,
          elevation: 20,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Color(0xff8c8c8c),
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 180 / 120,
                    child: SizedBox(
                      width: 218,
                      height: 113,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: campaigns.images!.isEmpty
                              ? ""
                              :"http://92.113.26.243:5000${campaigns.images?[0]}" ?? "",
                          errorWidget: (context, url, error) => SvgPicture.asset(
                            Assets.imagesEmptyImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(14),
                  AdsItemDetails(
                    campaigns: campaigns,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SaveButton(
                  campaignId: campaigns.id!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
