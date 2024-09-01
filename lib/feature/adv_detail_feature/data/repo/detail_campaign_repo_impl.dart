import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/core/utils/helper.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/repo/campaign_detail_repo.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CampaignDetailRepo)
class CampaignDetailRepoImpl implements CampaignDetailRepo {
  APiManger aPiManger;

  StorageToken storageToken;
  HiveManager hiveManager;

  CampaignDetailRepoImpl(this.aPiManger, this.storageToken, this.hiveManager);

  @override
  Future<Either<Failure, DetailCampaignModel>> getDetails(
      num campaignId) async {
    try {
      var id = await storageToken.getToken();
      var role = Helper.retrieveRole();
      var response = await aPiManger.post(EndPoints.detailCampaign,
          {"campaign_id": campaignId, "user_id": int.parse(id!), "role": role});
      DetailCampaignModel detailCampaignModel =
      DetailCampaignModel.fromJson(response.data);
      return right(detailCampaignModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> pressedLink(
      {required num? campaignId, required String? link}) async {
    try {
      var person = hiveManager.retrieveSingleData<Person>(HiveKeys.userBox);
      var uId = await storageToken.getToken();
      await aPiManger.post(EndPoints.linkPressed, {
        "user_id": uId,
        "campaign_id": campaignId,
        "role": person?.role,
        "link": link
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
