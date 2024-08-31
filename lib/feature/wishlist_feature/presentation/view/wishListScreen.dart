import 'package:atch_proj/core/services/rectangle_shimmer.dart';
import 'package:atch_proj/core/utils/app_color.dart';
import 'package:atch_proj/core/utils/app_style.dart';
import 'package:atch_proj/core/utils/components/loading_rectangle.dart';
import 'package:atch_proj/feature/account_feature/page/account_screen.dart';
import 'package:atch_proj/feature/home_layout_feature/presentation/manager/home_layout_cubit.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/manger/wishlist_cubit.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/view/widgets/ad_item.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/view/widgets/wishlist_empty_widget.dart';
import 'package:atch_proj/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          context.tr("navWishList"),
          style: AppStyle.style24Regular(context),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(20),
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
    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is WishlistAddedSuccessState) {
          WishlistCubit.get(context).getWishlist();
        }
      },
      builder: (context, state) {
        if (state is WishlistSuccessState) {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => AdWishlistItem(
                campaign: WishlistCubit.get(context).campaigns[index]!,
              ),
              separatorBuilder: (context, index) => const Gap(15),
              itemCount: WishlistCubit.get(context).campaigns.length,
            ),
          );
        } else if (state is WishlistEmptyState) {
          return const WishlistEmptyWidget();
        } else if (state is WishlistFailState) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        }
        return const Expanded(
          child: LoadingRectangleComponent(),
        );
      },
    );
  }
}
