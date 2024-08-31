import 'package:atch_proj/core/api/api_manger.dart';
import 'package:atch_proj/core/api/end_points.dart';
import 'package:atch_proj/core/erorr/failure.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/AddCampaignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/model/EditCampignModel.dart';
import 'package:atch_proj/feature/add_edit_campagin_feature/data/repo/add_campaign_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddCampaignRepo)
class AddCampaignRepoImpl implements AddCampaignRepo {
  APiManger aPiManger;

  AddCampaignRepoImpl(this.aPiManger);

  @override
  Future<Either<Failure, String>> addCampaign(
      AddCampaignModel addCampaignModel) async {
    try {
      var formData = addCampaignModel.formData();
      await aPiManger.post(EndPoints.addCampaign, formData);
      return right("Success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, String>> editCampaign(
      EditCampignModel editCampaignModel) async {
    try {
      var formData = editCampaignModel.formData();
      await aPiManger.post(EndPoints.editCampaign, formData);
      return right("success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromServer(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
