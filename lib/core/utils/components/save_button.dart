import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/services/snack_bar_services.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/manger/wishlist_cubit.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_color.dart';
import '../service_locator/config.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key, required this.campaignId});

  final num campaignId;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) async {
        if (state is WishlistLoadingState) {
        } else if (state is WishlistAddedSuccessState) {
          SnackBarServices.showSaveToWishList(context);
        } else if (state is WishlistFailState) {
          EasyLoading.showError(state.message);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            if (checkContainWishList()) {
              getIt<HiveManager>()
                  .retrieveSingleData<Person>(HiveKeys.userBox)
                  ?.wishlist
                  ?.remove(widget.campaignId);
              await getIt<HiveManager>()
                  .retrieveSingleData<Person>(HiveKeys.userBox)
                  ?.save();
              WishlistCubit.get(context).addToWishList(widget.campaignId);
            } else {
              getIt<HiveManager>()
                  .retrieveSingleData<Person>(HiveKeys.userBox)
                  ?.wishlist
                  ?.add(widget.campaignId);
              await getIt<HiveManager>()
                  .retrieveSingleData<Person>(HiveKeys.userBox)
                  ?.save();
              WishlistCubit.get(context).addToWishList(widget.campaignId);
              isSelected = !isSelected;
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: checkContainWishList()
                ? SvgPicture.asset(
                    Assets.imagesSelectedLove,
                    width: 20,
                    height: 20,
                  )
                : SvgPicture.asset(
                    Assets.imagesUnselectedLove,
                    width: 20,
                    height: 20,
                  ),
          ),
        );
      },
    );
  }

  bool checkContainWishList() {
    return getIt<HiveManager>()
            .retrieveSingleData<Person>(HiveKeys.userBox)
            ?.wishlist
            ?.contains(widget.campaignId) ??
        false;
  }
}
