import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  APiManger aPiManger;

  CancelToken? cancelToken;

  HomeRepoImpl(this.aPiManger);

  @override
  Future<Either<Failure, CampaignModel>> getNormalCampaign(
      String advType) async {
    if (cancelToken != null) {
      cancelToken!.cancel("Cancelled previous request");
    }
    cancelToken = CancelToken();
    try {
      var result = await aPiManger.post(
        EndPoints.getNormalCampaign,
        {"advertiser_type": advType},
        cancelTok: cancelToken,
      );
      CampaignModel campaignModel = CampaignModel.fromJson(result.data);
      return right(campaignModel);
    } catch (e) {
      if (e is DioException) {
        if (CancelToken.isCancel(e)) {
          print('Request canceled: ${e.message}');
        }
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CampaignModel>> getPopularCampaign(
      String advType) async {
    if (cancelToken != null) {
      cancelToken!.cancel("Cancelled previous request");
    }
    cancelToken = CancelToken();

    try {
      var result = await aPiManger.post(
          EndPoints.getPopularCampaign, {"advertiser_type": advType},
          cancelTok: cancelToken);
      CampaignModel campaignModel = CampaignModel.fromJson(result.data);
      return right(campaignModel);
    } catch (e) {
      if (e is DioException) {
        if (CancelToken.isCancel(e)) {
          print('Request canceled: ${e.message}');
        }
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CampaignModel>> getAdDetails() async {
    try {
      var result = await aPiManger.get(EndPoints.getPopularCampaign);
      CampaignModel campaignModel = CampaignModel.fromJson(result.data);
      return right(campaignModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
