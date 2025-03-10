import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Animate(
            child: Image.asset(Assets.imagesGLogo)
                .animate()
                .fade(duration: const Duration(seconds: 3)),
          ),
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () async {
      var token = await getIt<StorageToken>().getToken();
      token == null
          ? context.go(AppRoute.logInKey)
          : context.go(AppRoute.homeKey);
    });
  }
}
