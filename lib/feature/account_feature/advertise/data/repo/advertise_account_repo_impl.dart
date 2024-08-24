import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/account_feature/advertise/data/model/EditAdvertiseData.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/AdvertiseInfo.dart';
import 'advertise_account_repo.dart';

@Injectable(as: AdvertiseAccountRepo)
class AdvertiseAccountRepoImpl implements AdvertiseAccountRepo {
  APiManger aPiManger;
  StorageToken storageToken;

  AdvertiseAccountRepoImpl(this.aPiManger, this.storageToken);

  @override
  Future<Either<Failure, AdvertiseInfoModel>> getAdvertiseInfo() async {
    try {
      var id = await storageToken.getToken();
      var response = await aPiManger.post(
        EndPoints.advertiseInfo,
        {"advertiser_id": id},
      );
      AdvertiseInfoModel advertiseInfo = AdvertiseInfoModel.fromJson(response.data);
      return right(advertiseInfo);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> editAdvertise(EditAdvertiseData advertiseData) async{
    try {
      var formData= advertiseData.formData();
      await aPiManger.post(EndPoints.editProfileAdvertise, formData);

      return  right("success");
    } catch (e) {
      if (e is DioException) {

        return left(ServerFailure.fromServer(e));
      } else {
        print(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
