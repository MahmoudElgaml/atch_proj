import 'package:atch_proj/core/erorr/failure.dart';
import 'package:dartz/dartz.dart';

abstract class QrOfferRepo {
  Future<Either<Failure, String>> checkOfferValidate(num? campaignId);

  Future<Either<Failure, String>> takeOffer(
      {required num? campaignId, required num? advId});
}
