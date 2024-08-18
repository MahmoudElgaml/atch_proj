import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';

import 'package:dartz/dartz.dart';

abstract class WishlistRepo{
     Future<Either<Failure,CampaignModel>> getWishlist();
     Future<Either<Failure,String>> addToWishlist(num campaignId);


}