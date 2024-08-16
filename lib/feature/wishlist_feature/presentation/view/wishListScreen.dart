import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:atch_proj/feature/wishlist_feature/data/model/WishlistItemModel.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/manger/wishlist_cubit.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/view/widgets/ad_item.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/view/widgets/wishlist_empty_widget.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WishlistList(),
            ],
          ),
        ),
      ),
    );
  }
}

class WishlistList extends StatelessWidget {
  const WishlistList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        if (state is WishlistSuccessState) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => AdWishlistItem(
                wishItem: state.wishlist![index]!,
              ),
              separatorBuilder: (context, index) => const Gap(15),
              itemCount: state.wishlist?.length ?? 0,
            ),
          );
        } else if (state is WishlistEmptyState) {
          return const WishlistEmptyWidget();
        } else if (state is WishlistFailState) {
          return Center(child: Text(state.message));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
