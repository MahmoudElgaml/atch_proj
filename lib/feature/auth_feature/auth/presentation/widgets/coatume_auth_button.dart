import 'package:atch_proj/config/routes/routes.dart';
import 'package:atch_proj/core/services/upload_image_service.dart';
import 'package:atch_proj/core/utils/app_color.dart';
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: AppColor.yellowColor,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccessState) {
              UploadImageService.selectedImage = null;
              isLoading
                  ? context.go(AppRoute.homeKey,
                      extra: AuthCubit.get(context).userData)
                  : context.go(AppRoute.logInKey);
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuthFailState) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }
            return Text(
              title,
              style: AppStyle.style24BoldDarkBlue(context),
            );
          },
        ),
      ),
    );
  }
}
