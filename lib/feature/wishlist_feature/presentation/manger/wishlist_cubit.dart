import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/wishlist_feature/data/repo/wishlist_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.wishlistRepo) : super(WishlistInitial());
  WishlistRepo wishlistRepo;
  static WishlistCubit get(context)=>BlocProvider.of(context);
     List<Campaigns?> campaigns=[];
  getWishlist() async {
    emit(WishlistLoadingState());
    var result = await wishlistRepo.getWishlist();
    result.fold(
      (l) {
        emit(WishlistFailState(l.message));
      },
      (r) {
        if (r.campaigns!.isEmpty) {
          emit(WishlistEmptyState());
        } else {
          campaigns=r.campaigns??[];
          emit(WishlistSuccessState());
        }
      },
    );
  }

  addToWishList(num campaignId) async {
    emit(WishlistLoadingState());
    var result = await wishlistRepo.addToWishlist(campaignId);
    result.fold(
      (l) {
        emit(WishlistFailState(l.message));
      },
      (r) {
        getWishlist();
      },
    );
  }
}
