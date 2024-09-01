import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/services/loading_service.dart';
import 'core/utils/bloc_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  configureEasyLoading();
  await HiveManager().inti();
  await EasyLocalization.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("en"),
        Locale("ar"),
      ],
      fallbackLocale: const Locale('ar'),
      path: 'assets/translation',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routerConfig: AppRoute.router,
      ),
    );
  }
}
