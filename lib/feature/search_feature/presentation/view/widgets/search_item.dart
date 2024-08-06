import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 10,
      shadowColor: Colors.transparent,
      color: Colors.white24,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.transparent)),
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
              children: [
                Text(
                  "1st  May- Sat -2:00 PM",
                  style: AppStyle.style12Regular(context),
                ),
                FittedBox(
                  child: SizedBox(
                    width: 170,
                    child: Text(
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
