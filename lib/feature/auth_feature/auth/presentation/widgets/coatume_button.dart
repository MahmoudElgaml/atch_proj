import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/feature/auth_feature/auth/presentation/manger/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_style.dart';

class CostumeButton extends StatelessWidget {
  const CostumeButton(
      {required this.title,
      super.key,
      required this.onPressed,
      required this.isLoading});

  final String title;
  final bool isLoading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 68,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
        gradient: LinearGradient(
          colors: [Color(0xff8658E8), Color(0xff4718AD)],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccessState) {
              UploadImageService.selectedImage=null;
              isLoading
                  ? context.push(AppRoute.homeKey,extra: AuthCubit.get(context).userData)
                  : context.go(AppRoute.logInKey);
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuthFailState) {
              print(state.message.toString());
              return Center(child: Text(state.message,style: const TextStyle(color: Colors.white),));
            }
            return Text(
              title,
              style: AppStyle.styleWhite,
            );
          },
        ),
      ),
    );
  }
}
