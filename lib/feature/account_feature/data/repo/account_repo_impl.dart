import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/account_feature/data/repo/account_repo.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:  AccountRepo)
class AccountRepoImpl implements AccountRepo {
  APiManger aPiManger;
  StorageToken storageToken;

  AccountRepoImpl(this.aPiManger, this.storageToken);

  @override
  Future<Either<Failure, CampaignModel>> getUsedOffer() async {
    try {
      var id = await storageToken.getToken();
      var response = await aPiManger.post(EndPoints.getUsedOffer, {
        "user_id": id,
      });

      CampaignModel usedCampaigns = CampaignModel.fromJson(response.data);

    return  right(usedCampaigns);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        print(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, CampaignModel>> getRecentlyView() async {
    try {
      var id = await storageToken.getToken();
      var response = await aPiManger.post(EndPoints.getRecentlyViewed, {
        "user_id": id,
      });

      CampaignModel usedCampaigns = CampaignModel.fromJson(response.data);

    return  right(usedCampaigns);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        print(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
