import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/manger/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
          EasyLoading.show();
        } else if (state is WishlistAddedSuccessState) {
          EasyLoading.dismiss();
          print(
              getIt<HiveManager>().retrieveListData<num>(HiveKeys.wishlistBox));
        } else if (state is WishlistFailState) {
          EasyLoading.showError(state.message);
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            if (getIt<HiveManager>()
                .retrieveListData<num>(HiveKeys.wishlistBox)
                .contains(widget.campaignId)) {
              await getIt<HiveManager>().deleteSpecificData<num>(
                  HiveKeys.wishlistBox, widget.campaignId);
              WishlistCubit.get(context).addToWishList(widget.campaignId);
            } else {
              await getIt<HiveManager>().cacheNormalData<num>(
                  boxKey: HiveKeys.wishlistBox, dataItem: widget.campaignId);
              WishlistCubit.get(context).addToWishList(widget.campaignId);
              isSelected = !isSelected;
            }
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Icon(
                Icons.favorite,
                color: getIt<HiveManager>()
                        .retrieveListData<num>(HiveKeys.wishlistBox)
                        .contains(widget.campaignId)
                    ? Color(0xffeb5757)
                    : Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
