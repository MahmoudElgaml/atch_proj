import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

Future<Either<Failure,CampaignModel>>  getPopularCampaign(String advType);
Future<Either<Failure,CampaignModel>>  getNormalCampaign(String advType);
Future<Either<Failure, CampaignModel>> getAdDetails();

}