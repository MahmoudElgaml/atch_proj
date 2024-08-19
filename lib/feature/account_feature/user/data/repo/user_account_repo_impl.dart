import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';


import 'package:atch_proj/feature/home_feature/data/model/CampaignModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/EditUserData.dart';
import 'user_account_repo.dart';
@Injectable(as:  UserAccountRepo)
class AccountRepoImpl implements UserAccountRepo {
  APiManger aPiManger;
  StorageToken storageToken;

  AccountRepoImpl(this.aPiManger, this.storageToken);

  @override
  Future<Either<Failure, CampaignModel>> getUsedOffer() async {
    try {
      var id = await storageToken.getToken();
      var response = await aPiManger.post(EndPoints.getUsedOffer, {
        "user_id": 6,
      });

      CampaignModel usedCampaigns = CampaignModel.fromJson(response.data);

    return  right(usedCampaigns);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        print(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }
  @override
  Future<Either<Failure, CampaignModel>> getRecentlyView() async {
    try {
      var id = await storageToken.getToken();
      var response = await aPiManger.post(EndPoints.getRecentlyViewed, {
        "user_id": id,
      });

      CampaignModel usedCampaigns = CampaignModel.fromJson(response.data);

    return  right(usedCampaigns);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        print(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> editProfileUSer(EditUserData editUserData) async{
    try {
     var formData=editUserData.formData();
       await aPiManger.post(EndPoints.editProfileUSer, formData);


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
