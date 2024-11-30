import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/AdvertiseInfo.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/EditAdvertiseData.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:dartz/dartz.dart';

abstract class AdvertiseAccountRepo{
 Future<Either<Failure,AdvertiseInfoModel>> getAdvertiseInfo();

  Future<Either<Failure, CampaignModel>> getAdvertiserUnApprovedCampaign();
  Future<Either<Failure,String>> editAdvertise(EditAdvertiseData advertiseData);
 Future<Either<Failure, String>> deleteCampaign(num?campaignId);
 Future<Either<Failure, String>> deleteAccount(num?id,String?role);


}