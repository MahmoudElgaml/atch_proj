import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/add_campaign_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/login_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/sign_up_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/widgets/sign_up_advertise.dart';
import 'package:atch_proj/feature/home_feature/presentation/widgets/ad_details_screen.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:go_router/go_router.dart';

import '../../feature/home_layout_feature/presentation/view/home_screen.dart';
import '../../feature/splash_feature/presentation/view/splash_view.dart';
class AppRoute {
  static const String splashKey = "/";
  static const String signInKey = "/signup";
  static const String logInKey = "/login";
  static const String homeKey = "/home";
  static const String adDetails="/adDetails";
  static const String signUpAsAdvertise="/advertise";
  static const String addCampaign="/addCampaign";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashKey,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: signInKey,
        builder: (context, state) => const SignUpScreen(),
      ),

      GoRoute(
        path: logInKey,
        builder: (context, state) => const LoginScreen() ,
      ),
      GoRoute(
        path: homeKey,
        builder: (context, state) => BlocProvider(
            create: (context) =>getIt<HomeLayoutCubit>(),
            child: const HomeScreenLayout()) ,
      ),
      GoRoute(
        path: adDetails,
        builder: (context, state) => const AdDetailsScreen() ,
      ),
      GoRoute(
        path: signUpAsAdvertise,
        builder: (context, state) => const SignUpAdvertise() ,
      ),
      GoRoute(
        path: addCampaign,
        builder: (context, state) => const AddCampaignScreen() ,
      ),
    ],
  );
}
