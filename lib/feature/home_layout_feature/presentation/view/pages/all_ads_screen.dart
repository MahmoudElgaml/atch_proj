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
        children: [Center(child: Text("All Ads"))],
      ),
    );
  }
}
