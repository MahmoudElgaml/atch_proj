import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_feature/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failure, CampaignModel>> getNormalCampaign() {
    // TODO: implement getNormalCampaign
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CampaignModel>> getPopularCampaign() {
    // TODO: implement getPopularCampaign
    throw UnimplementedError();
  }

}