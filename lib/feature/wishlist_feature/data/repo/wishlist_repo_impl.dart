import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:atch_proj/feature/wishlist_feature/data/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../home_feature/data/model/CampaignModel.dart';

@Injectable(as: WishlistRepo)
class WishlistRepoImpl implements WishlistRepo {
  APiManger aPiManger;
  StorageToken storageToken;
  HiveManager hiveManager;

  WishlistRepoImpl(this.aPiManger, this.storageToken, this.hiveManager);

  @override
  Future<Either<Failure, CampaignModel>> getWishlist() async {
    try {
      var id = await storageToken.getToken();
      var response = await aPiManger.post(EndPoints.getWishlist, {
        "user_id": id,
      });
      CampaignModel campaignModel = CampaignModel.fromJson(response.data);
      return right(campaignModel);
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
      print(id ?? "null");
      var role =
          hiveManager.retrieveSingleData<Person>(HiveKeys.userBox).role ?? "user";
      print(hiveManager.retrieveSingleData<Person>(HiveKeys.userBox));


      print(role);
      await aPiManger.post(EndPoints.addToWishlist, {
        "user_advertiser_id": id,
        "campaign_id": campaignId,
        "role": role,
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
