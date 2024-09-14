import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_layout_feature/data/repo/home_layout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLayoutRepo)
class HomeLayoutRepoImpl implements HomeLayoutRepo {
  APiManger aPiManger;

  HomeLayoutRepoImpl(this.aPiManger);

  @override
  Future<Either<Failure, CampaignModel>> getAllCampaigns() async {
    try {
      var response = await aPiManger.get(EndPoints.getAllAds);
      CampaignModel allCampaign = CampaignModel.fromJson(response.data);
      return right(allCampaign);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
