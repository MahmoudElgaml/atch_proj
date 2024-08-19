import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/advertiser_info_feature/data/repo/adv_info_repo.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AdvInfoRepo)
class AdvInfoImpl implements AdvInfoRepo {
  APiManger aPiManger;
  StorageToken storageToken;

  AdvInfoImpl(this.aPiManger, this.storageToken);

  @override
  Future<Either<Failure, CampaignModel>> gerAdvCampaign(int advId) async {
    try {
      var response = await aPiManger.post(EndPoints.getAdvCampaigns, {
        "advertiser_id": advId,
      });
      CampaignModel campaigns = CampaignModel.fromJson(response.data);
      return right(campaigns);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
