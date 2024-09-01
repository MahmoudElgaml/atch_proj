import 'package:atch_proj/feature/adv_detail_feature/prsentation/manager/impression_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/service_locator/config.dart';

class AdDetailVideoSection extends StatelessWidget {
  const AdDetailVideoSection(
      {super.key, required this.videos, required this.campaignId});

  final List<String>? videos;
  final num? campaignId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ImpressionCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${context.tr("videos")} :",
            style: AppStyle.style24Regular(context),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 150,
              child: Card(
                elevation: 10,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (context, index) => const Gap(10),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      onTap: () {
                        ImpressionCubit.get(context)
                            .linkPressed(campaignId, videos?[index]);
                        lunchYouUrl(videos?[index]);
                      },
                      child: Linkify(
                        text: videos?[index] ?? "",
                        style: AppStyle.style24Regular(context),
                      ),
                    ),
                  ),
                  itemCount: videos?.length ?? 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> lunchYouUrl(String? video) async {
    try {
      final Uri uri = Uri.parse(video ?? "");
      if (await canLaunchUrl(uri)) {
        launchUrl(uri);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
