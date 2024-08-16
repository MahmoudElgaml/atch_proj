import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/wishlist_feature/data/model/WishlistItemModel.dart';
import 'package:atch_proj/feature/wishlist_feature/data/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRepo)
class WishlistRepoImpl implements WishlistRepo {
  APiManger aPiManger;
  StorageToken storageToken;

  WishlistRepoImpl(this.aPiManger, this.storageToken);

  @override
  Future<Either<Failure, WishlistItemModel>> getWishlist() async {
    try {
      var id = await storageToken.getToken();
      var response = await aPiManger.post(EndPoints.getWishlist, {
        "user_id": id,
      });
      WishlistItemModel wishlistItemModel =
          WishlistItemModel.fromJson(response.data);
      return right(wishlistItemModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> addToWishlist(num campaignId) async {
    try {
      var id = await storageToken.getToken();
      await aPiManger.post(EndPoints.addToWishlist, {
        "user_id": id,
        "campaign_id": campaignId,
      });
      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }

    }
  }
}
