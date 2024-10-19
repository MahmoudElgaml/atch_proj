import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SelectRoleSigUpPage extends StatelessWidget {
  const SelectRoleSigUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => context.push(AppRoute.signUpAsAdvertise),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.darkBlue,
                    ),
                    child: Center(
                      child: Image.asset(
                        Assets.imagesAdvertiserBadge,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.push(AppRoute.signInKey);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.yellowColor,
                    ),
                    child: Center(child: Image.asset(Assets.imagesUserBadge)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1000),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 9),
            height: 46,
            child: FittedBox(
              child: Center(
                child: Text(
                  "Account Type",
                  textAlign: TextAlign.center,
                  style: AppStyle.style24Medium(context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
