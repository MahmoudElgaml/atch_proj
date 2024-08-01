import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'costume_avatar.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CostumeAvatar(Assets.imagesGoogle),
          Gap(7),
          CostumeAvatar(Assets.imagesFacebook),
          Gap(7),
          CostumeAvatar(Assets.imagesApple)
        ],
      ),
    );
  }
}
