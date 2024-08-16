import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/wishlist_feature/data/model/WishlistItemModel.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRepo{
     Future<Either<Failure,WishlistItemModel>> getWishlist();
     Future<Either<Failure,String>> addToWishlist(int campaignId);


}