import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/page/edit_account_screen.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_campaign_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_image_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/change_date_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/link_feature_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/old_image_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/add_campaign_screen.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/edit_campaign_screen.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/advertiser_info_page.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/login_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/sign_up_user_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/test_upload_image.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/sign_up_advertise.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/pages/ad_details_screen.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/manger/qr_offer_cubit.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/view/pages/qr_offer_screen.dart';
import 'package:atch_proj/feature/unite_testing/manger/test_cubit.dart';
import 'package:atch_proj/feature/unite_testing/test_view.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/view/wishListScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../feature/home_layout_feature/presentation/view/home_screen.dart';
import '../../feature/splash_feature/presentation/view/splash_view.dart';

class AppRoute {
  static const String splashKey = "/";
  static const String signInKey = "/signup";
  static const String logInKey = "/login";
  static const String homeKey = "/home";
  static const String adDetails = "/adDetails";
  static const String signUpAsAdvertise = "/advertise";
  static const String addCampaign = "/addCampaign";
  static const String advertiserInfoPage = "/adver";
  static const String editUserPage = "/edituser";
  static const String test = "/test";
  static const String editCampaign = "/editCampaign";
  static const String qrOffer = "/qrOffer";

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
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: homeKey,
        builder: (context, state) =>
            BlocProvider(
                create: (context) => getIt<HomeLayoutCubit>(),
                child: const HomeScreenLayout()),
      ),
      GoRoute(
        path: adDetails,
        builder: (context, state) => const AdDetailsScreen(),
      ),
      GoRoute(
        path: signUpAsAdvertise,
        builder: (context, state) => const SignUpAdvertise(),
      ),
      GoRoute(
        path: addCampaign,
        builder: (context, state) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<AddImageCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<LinkFeatureCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<ChangeDateCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<AddCampaignCubit>(),
                ),
              ],
              child: AddCampaignScreen(),
            ),
      ),
      GoRoute(
        path: test,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => getIt<TestCubit>(),
              child: const TestView(),
            ),
      ),
      GoRoute(
        path: advertiserInfoPage,
        builder: (context, state) => const AdvertiserInfoPage(),
      ),
      GoRoute(
        path: editUserPage,
        builder: (context, state) => const EditAccountScreen(),
      ),
      GoRoute(
        path: editCampaign,
        builder: (context, state) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<AddCampaignCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<ChangeDateCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<AddImageCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<LinkFeatureCubit>(),
                ),
                BlocProvider(
                  create: (context) => getIt<OldImageCubit>(),
                ),
              ],
              child: const EditCampaignScreen(),
            ),
      ),
      GoRoute(
        path: qrOffer,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => getIt<QrOfferCubit>(),
              child: const QrOfferScreen(),
            ),
      ),
    ],
  );
}
