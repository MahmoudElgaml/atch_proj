import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdDetailsLocationWidget extends StatelessWidget {
  const AdDetailsLocationWidget(this.image,this.location, {super.key});

  final String image;
final   List<String> location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
        child: Row(
          children: [
            Image.asset(image,width: 48,),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:location.map((e) => Text(e),).toList()
            )
          ],
        ),
      ),
    );
  }


}
