import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:dartz/dartz.dart';

abstract class CampaignDetailRepo{
  Future<Either<Failure,DetailCampaignModel>> getDetails(num campaignId);


}