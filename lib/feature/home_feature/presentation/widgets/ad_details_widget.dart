import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdDetailsWidget extends StatelessWidget {
  AdDetailsWidget(this.image,this.firstText,this.SecondText);

  String image;
  String firstText;
  String SecondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Image.asset(image,width: 48,),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(firstText),
              Gap(5),
              Text(SecondText)
            ],
          )
        ],
      ),
    );
  }


}
