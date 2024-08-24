import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../services/rectangle_shimmer.dart';

class LoadingRectangleComponent extends StatelessWidget {
  const LoadingRectangleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.grey[100]!,
        child: ListView.separated(
          itemBuilder: (context, index) => const Skeleton(
            height: 90,
            width: double.infinity,
          ),
          separatorBuilder: (context, index) => const Gap(10),
          itemCount: 10,
        ),
      ),
    );
  }
}