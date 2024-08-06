import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{

  APiManger aPiManger;

  HomeRepoImpl(this.aPiManger);


  @override
  Future<Either<Failure, CampaignModel>> getNormalCampaign() async{
    try{
      var result=await aPiManger.get(EndPoints.getNormalCampaign);
      CampaignModel campaignModel=CampaignModel.fromJson(result.data);
      return right(campaignModel);


    }
    catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }


    }
  }

  @override
  Future<Either<Failure, CampaignModel>> getPopularCampaign() async{
    try{
      var result=await aPiManger.get(EndPoints.getPopularCampaign);
      CampaignModel campaignModel=CampaignModel.fromJson(result.data);
      return right(campaignModel);

    }
    catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }


    }

  }

}