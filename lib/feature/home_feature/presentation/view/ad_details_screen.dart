import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ad_details_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdDetailsScreen extends StatelessWidget {
  const AdDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Campaigns campaign = GoRouterState.of(context).extra! as Campaigns;
    return Scaffold(
      body: AdDetailsSection(
        campaign: campaign,
      ),
    );
  }
}
