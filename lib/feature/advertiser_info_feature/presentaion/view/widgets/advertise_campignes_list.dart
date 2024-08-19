import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/assets.dart';

class AdvertiseCampaignsList extends StatelessWidget {
  const AdvertiseCampaignsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      itemBuilder: (context, index) => const TestItem(),
      separatorBuilder: (context, index) => const Gap(10),
      itemCount: 10,
    );
  }
}
class TestItem extends StatelessWidget {
  const TestItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
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
            SizedBox(
              height: 92,
              width: 79,
              child: AspectRatio(
                aspectRatio: 79 / 92,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    width: 79,
                    Assets.imagesSearchImageTest,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Gap(18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  " No Date",
                  style: AppStyle.style12Regular(context),
                ),
                Text(
                  "46546464",
                  style: AppStyle.style18(context),
                ),
                const Gap(7),
                FittedBox(
                  child: SizedBox(
                    width: 170,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "A virtual evening of smooth jazz",
                      maxLines: 2,
                      style: AppStyle.style18(context),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
