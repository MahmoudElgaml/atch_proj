import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/bloc_observer.dart';


void main() {
  Bloc.observer = MyBlocObserver();
   configureDependencies();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<AuthCubit>() ,
      child: MaterialApp.router(
        theme: ThemeData(

           iconTheme: const IconThemeData(
             color: Colors.black
           ),
          primarySwatch: Colors.blue,
        ),
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routerConfig: AppRoute.router,
      ),
    );
  }
}
