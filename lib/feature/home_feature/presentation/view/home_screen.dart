import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/all_campain.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/popular_ads.dart';
import '../widgets/tabs_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomAppBar(),
        const Gap(17),
        Expanded(
          child: SingleChildScrollView(
            child: Column(

              children: [
                const TabsAppBar(),
                ElevatedButton(onPressed: () {
                  if(context.locale.toString()=="ar"){
                    context.setLocale(const Locale('en'));
                  }else{
                    context.setLocale(const Locale('ar'));
                  }

                }, child:const Text("change local")),
                const Gap(17),
                const PopularAds(),
                const Gap(17),
                const AllAds(),
                const Gap(20),
              ],
            ),
          ),
        )
      ],
    );
  }
}
