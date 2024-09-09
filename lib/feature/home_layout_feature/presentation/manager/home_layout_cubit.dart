import 'package:atch_proj/core/utils/service_locator/config.dart';
import 'package:atch_proj/feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/manager/get_normal_campagin_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/manager/get_popular_campaign_cubit.dart';
import 'package:atch_proj/feature/home_feature/presentation/view/home_screen.dart';
import 'package:atch_proj/feature/search_feature/presentation/manger/search_cubit.dart';
import 'package:atch_proj/feature/search_feature/presentation/view/search_view.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/manger/wishlist_cubit.dart';
import 'package:atch_proj/feature/wishlist_feature/presentation/view/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../account_feature/page/account_screen.dart';

part 'home_layout_state.dart';
@injectable
class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeState());
  static  HomeLayoutCubit get(context)=>BlocProvider.of(context);
  viewTap(int index) {
    switch (index) {
      case 0:
        emit(HomeState());
      case 1:
        emit(SearchState());
      case 2:
        emit(WishListState());
      case 3:
        emit(AccountState());
    }
  }
}
