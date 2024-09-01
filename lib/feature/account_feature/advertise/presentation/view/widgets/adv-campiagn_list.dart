import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/routes/routes.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_style.dart';
import '../../../../../../generated/assets.dart';
import '../../../data/model/AdvertiseInfo.dart';

class AdvAccountCampaignList extends StatelessWidget {
  const AdvAccountCampaignList({super.key, required this.advertiseCampaigns});

  final List<AdvertiseCampaigns> advertiseCampaigns;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => AdvAccountCampaignItem(
        campaigns: advertiseCampaigns[index],
      ),
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: advertiseCampaigns.length,
    );
  }
}

class AdvAccountCampaignItem extends StatelessWidget {
  const AdvAccountCampaignItem({super.key, required this.campaigns});

  final AdvertiseCampaigns campaigns;

  @override
  Widget build(BuildContext context) {
    print(campaigns.images);
    return Card(
      elevation: 10,
      shadowColor: Colors.white24,
      color: Colors.white24,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 92,
                width: 79,
                child: AspectRatio(
                  aspectRatio: 79 / 92,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: campaigns.images!.isEmpty
                          ? ""
                          : "http://92.113.26.243:5000${campaigns.images?[0]}" ??
                              "",
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        Assets.imagesEmptyImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(18),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          campaigns.endDate?.substring(0, 16) ?? " No Date",
                          style: AppStyle.style18Regular(context),
                        ),
                        Text(
                          campaigns.campaignName ?? "",
                          style: AppStyle.style18(context),
                        ),
                        const Gap(7),
                        FittedBox(
                          child: SizedBox(
                            width: 170,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              campaigns.description ?? "",
                              maxLines: 2,
                              style: AppStyle.style18(context),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              final copiedData = campaigns.copyWith();
                              context.push(
                                AppRoute.editCampaign,
                                extra: copiedData,
                              );
                            },
                            child: SvgPicture.asset(Assets.imagesEdit),
                          ),
                        ),
                        const Gap(15),
                        Flexible(
                          child: IconButton(
                            onPressed: () {
                              AdvertiseInfoCubit.get(context)
                                  .deleteCampaign(campaigns.id);
                            },
                            icon: const Icon(
                              size: 26,
                              Icons.delete_outline,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
