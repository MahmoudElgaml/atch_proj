import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';


import '../../../../../core/utils/app_color.dart';
import '../widgets/login_drawer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColor.authColor,
            height: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 88, left: 36),
                  child: Image.asset(Assets.imagesBubbleText),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    Assets.imagesLogInPhoto,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          const LogInDrawer(),
        ],
      ),
    );
  }
}
