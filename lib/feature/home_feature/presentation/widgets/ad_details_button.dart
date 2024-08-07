import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class AdDetailsButton extends StatelessWidget {
  const AdDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 85,
        width: 350,
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Text("Get Offer",style: AppStyle.style13(context).copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w400
            ),),
          ), Icon(Icons.arrow_forward,color: Colors.white,size: 30,)],
        ));
  }
}
