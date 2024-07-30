import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:atch_proj/generated/assets.dart';

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import '../../../../../core/utils/app_color.dart';
import '../widgets/signup_drawer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColor.authColor,
            height: double.infinity,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 88, left: 36),
                  child: Column(
                    children: [
                      Image.asset(Assets.imagesBubbleTextSign),
                      const Gap(16),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('Getting Start!'),
                          ],
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Image.asset(
                      Assets.imagesLogInPhoto,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SignUpDrawer()
        ],
      ),
    );
  }
}
