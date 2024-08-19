import 'package:atch_proj/core/erorr/failure.dart';

import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:dartz/dartz.dart';

import '../model/EditUserData.dart';

abstract class UserAccountRepo {
 Future<Either<Failure,CampaignModel>> getUsedOffer();
 Future<Either<Failure,CampaignModel>> getRecentlyView();
 Future<Either<Failure,String>> editProfileUSer(EditUserData editUserData);

}