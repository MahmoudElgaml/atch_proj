import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/cache/hive/hive_manager.dart';
import 'package:atch_proj/core/cache/storage_token.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/model/DetailCampaignModel.dart';
import 'package:atch_proj/feature/adv_detail_feature/data/repo/campaign_detail_repo.dart';
import 'package:atch_proj/feature/auth_feature/auth/data/model/UserData.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CampaignDetailRepo )
class CampaignDetailRepoImpl implements CampaignDetailRepo {
  APiManger aPiManger;

  StorageToken storageToken;

  CampaignDetailRepoImpl(this.aPiManger,this.storageToken);

  @override
  Future<Either<Failure, DetailCampaignModel>> getDetails(num campaignId)async {
 try{
   var id=await storageToken.getToken();
   var response=await aPiManger.post(EndPoints.detailCampaign, {
     "campaign_id": campaignId,
     "user_id": int.parse(id!)
   });
   DetailCampaignModel detailCampaignModel=DetailCampaignModel.fromJson(response.data);
   return right(detailCampaignModel);
 }
 catch(e){
    if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }


 }
  }


}