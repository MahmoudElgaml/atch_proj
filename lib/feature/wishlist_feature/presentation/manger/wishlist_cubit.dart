import 'package:atch_proj/feature/wishlist_feature/data/model/WishlistItemModel.dart';
import 'package:atch_proj/feature/wishlist_feature/data/repo/wishlist_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'wishlist_state.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.wishlistRepo) : super(WishlistInitial());
  WishlistRepo wishlistRepo;

  getWishlist() async {
    emit(WishlistLoadingState());
    var result = await wishlistRepo.getWishlist();
    result.fold(
      (l) {
        emit(WishlistFailState(l.message));
      },
      (r) {
        if (r.wishlist!.isEmpty) {
          emit(WishlistEmptyState());
        } else {
          emit(WishlistSuccessState(r.wishlist));
        }
      },
    );
  }
}
