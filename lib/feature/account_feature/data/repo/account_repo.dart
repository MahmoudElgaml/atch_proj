import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/account_feature/data/model/EditUserData.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepo {
 Future<Either<Failure,CampaignModel>> getUsedOffer();
 Future<Either<Failure,CampaignModel>> getRecentlyView();
 Future<Either<Failure,String>> editProfileUSer(EditUserData editUserData);

}