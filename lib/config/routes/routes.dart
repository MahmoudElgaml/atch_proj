import 'package:atch_proj/config/routes/navigation_helper.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/page/edit_account_screen.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_campaign_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/add_image_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/change_date_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/link_feature_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/manager/old_image_cubit.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/add_campaign_screen.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/presentaion/view/edit_campaign_screen.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart';
import 'package:atch_proj/feature/advertiser_info_feature/presentaion/view/advertiser_info_page.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/login_page.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/login_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/select_role_sigup_page.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/sign_up_user_page.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/sign_up_user_screen.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/pages/sign_up_advertise.dart';
import 'package:atch_proj/feature/adv_detail_feature/prsentation/view/pages/ad_details_screen.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/drawer_cubit.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/manger/qr_offer_cubit.dart';
import 'package:atch_proj/feature/qr_offer_feature/presentation/view/pages/qr_offer_screen.dart';
import 'package:atch_proj/feature/setting_feature/presentaion/view/setting_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import '../../feature/home_layout_feature/presentation/view/pages/all_ads_screen.dart';
import '../../feature/home_layout_feature/presentation/view/pages/home_screen.dart';
import '../../feature/splash_feature/presentation/view/splash_view.dart';

class AppRoute {
  static const String splashKey = "/spalsh";
  static const String signInKey = "/signup";
  static const String logInKey = "/login";
  static const String homeKey = "/home";
  static const String adDetails = "/adDetails";
  static const String signUpAsAdvertise = "/advertise";
  static const String addCampaign = "/addCampaign";
  static const String advertiserInfoPage = "/adver";
  static const String editUserPage = "/edituser";
  static const String test = "/";
  static const String selectRole = "/selectRole";
  static const String editCampaign = "/editCampaign";
  static const String qrOffer = "/qrOffer";
  static const String setting = "/settings";
  static const String allAds = "/allAds";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: selectRole,
        pageBuilder: (context, state) {
          return NavigationHelper.navigateFromBottomToUp(
            yourWidget: const SelectRoleSigUpPage(),
          );
        },
      ),
      GoRoute(
        path: splashKey,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: signInKey,
        pageBuilder: (context, state) =>
            NavigationHelper.navigateFromBottomToUp(
          yourWidget: BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignUpUserPage(),
          ),
        ),
      ),
      GoRoute(
        path: logInKey,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: homeKey,
        builder: (context, state) => BlocProvider(
            create: (context) => getIt<HomeLayoutCubit>(),
            child: const HomeScreenLayout()),
      ),
      GoRoute(
        path: adDetails,
        builder: (context, state) => const AdDetailsScreen(),
      ),
      GoRoute(
        path: signUpAsAdvertise,
        pageBuilder: (context, state) =>
            NavigationHelper.navigateFromTopToBottom(
                yourWidget: BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const SignUpAdvertise(),
        )),
      ),
      GoRoute(
        path: addCampaign,
        builder: (context, state) => MultiBlocProvider(
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
          child: const AddCampaignScreen(),
        ),
      ),
      GoRoute(
        path: test,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: advertiserInfoPage,
        builder: (context, state) => BlocProvider(
          create: (context) {
            var detailAdv = state.extra as DetailAdvertiser;
            var advId = detailAdv.id;
            return getIt<AdvInfoCubit>()..getAdvCampaigns(advId);
          },
          child: const AdvertiserInfoPage(),
        ),
      ),
      GoRoute(
        path: editUserPage,
        builder: (context, state) => const EditAccountScreen(),
      ),
      GoRoute(
        path: editCampaign,
        builder: (context, state) => MultiBlocProvider(
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
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<QrOfferCubit>(),
          child: const QrOfferScreen(),
        ),
      ),
      GoRoute(
        path: setting,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: allAds,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<DrawerCubit>(),
          child: const AllAdsScreen(),
        ),
      )
    ],
  );
}
