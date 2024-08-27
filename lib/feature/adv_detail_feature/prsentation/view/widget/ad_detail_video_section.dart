import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';

class AdDetailVideoSection extends StatelessWidget {
  const AdDetailVideoSection({super.key,required this.videos});
final List<String>?videos;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Videos:",
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
                padding:const EdgeInsets.symmetric(horizontal: 20) ,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Linkify(
                    text: videos?[index] ?? "",
                    style: AppStyle.style24Regular(context),
                  ),
                ),
                itemCount: videos?.length ?? 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
