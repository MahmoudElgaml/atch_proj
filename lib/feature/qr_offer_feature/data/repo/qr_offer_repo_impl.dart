import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/qr_offer_feature/data/repo/qr_offer_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: QrOfferRepo)
class QrOfferRepoImpl implements QrOfferRepo {
  APiManger aPiManger;
  StorageToken storageToken;

  QrOfferRepoImpl(this.aPiManger, this.storageToken);

  @override
  Future<Either<Failure, String>> checkOfferValidate(num? campaignId) async {
    try {
      var uId = await storageToken.getToken();
      var response = await aPiManger.post(EndPoints.checkOfferVal, {
        "user_id": uId,
        "campaign_id": campaignId,
      });
      return right(response.data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> takeOffer(
      {required num? campaignId, required num? advId}) async {
    try {
      var uId = await storageToken.getToken();
      var response = await aPiManger.post(EndPoints.takeOffer, {
        "user_id": uId,
        "campaign_id": campaignId,
        "qr_advertiser_id": advId
      });
      return right(response.data["message"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
