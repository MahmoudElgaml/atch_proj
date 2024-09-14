import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/widgets/campaign_item.dart';
import 'package:flutter/material.dart';

class AllAdsScreen extends StatelessWidget {
  const AllAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Campaigns"),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: AllAdsList(allCampaigns: []),
          )
        ],
      ),
    );
  }
}

class AllAdsList extends StatelessWidget {
  const AllAdsList({super.key, required this.allCampaigns});

  final List<Campaigns> allCampaigns;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: allCampaigns.length,
        itemBuilder: (context, index) {
          return CampaignItem(
            campaigns: allCampaigns[index],
          );
        },
      ),
    );
  }
}
