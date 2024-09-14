import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:atch_proj/feature/home_layout_feature/data/repo/home_layout_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeLayoutRepo)
class HomeLayoutRepoImpl implements HomeLayoutRepo {
  @override
  Future<Either<Failure, CampaignModel>> getAllCampaigns() {
    // TODO: implement getAllCampaigns
    throw UnimplementedError();
  }
}
