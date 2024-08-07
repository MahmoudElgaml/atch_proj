import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AdDetailsFistSection extends StatelessWidget {
  const AdDetailsFistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(
            Assets.imagesAdImage,width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                IconButton(onPressed: (){
                  GoRouter.of(context).pop();
                }, icon:const Icon(Icons.arrow_back,color: Colors.white,)),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 38.0),
                  child: Text("AD Details",style: AppStyle.style34(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  ),),
                ),
                Gap(110),
                Image.asset(
                    Assets.imagesFavicon
                )
              ],
            ),
          ),
          Container(

          ),
        ]);
  }
}
