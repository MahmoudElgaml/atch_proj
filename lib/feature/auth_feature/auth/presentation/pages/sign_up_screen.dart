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
              color: Colors.white,
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top:44.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 212,
                        height: 197,
                        child: Image.asset(Assets.imagesGLogo)),
                  ],
                ),
              )
          ),

          const SignUpDrawer()
        ],
      ),
    );
  }
}
