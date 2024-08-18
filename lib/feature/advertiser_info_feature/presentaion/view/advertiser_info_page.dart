import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/search_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../generated/assets.dart';

class AdvertiserInfoPage extends StatelessWidget {
  const AdvertiserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Advertiser advertiser =
        GoRouterState.of(context).extra! as Advertiser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            width: double.infinity,
                            imageUrl: advertiser.advertiserPic ?? "",
                            errorWidget: (context, url, error) =>
                                Image.asset(Assets.assetsImagesEmptyImage),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * .53,
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            tabs: const [
                              Tab(
                                child: Text(
                                  "About",
                                ),
                              ),
                              Tab(
                                child: Text("campaigns"),
                              ),
                            ],
                            dividerColor: AppColor.primaryColor,
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            labelStyle: AppStyle.style16Regular(context),
                            indicatorColor: AppColor.primaryColor,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TabBarView(
                                children: [
                                  Text(
                                    advertiser.about ?? "",
                                    style: AppStyle.style16Regular(context),
                                  ),
                                  const AdvertiseCampaignList(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AdvertiseCampaignList extends StatelessWidget {
  const AdvertiseCampaignList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => const TestItem(),
        separatorBuilder: (context, index) => Gap(10),
        itemCount: 10);
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
